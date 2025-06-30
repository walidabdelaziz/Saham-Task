//
//  OrderDetailsUseCase.swift
//  Saham Task
//
//  Created by Walid Ahmed on 30/06/2025.
//
import Foundation

protocol OrdersWebSocketUseCase {
    func connect(orderId: Int, onUpdate: @escaping (Order) -> Void)
    func disconnect()
}

class OrdersWebSocketUseCaseImpl: OrdersWebSocketUseCase {
    private var webSocketTask: URLSessionWebSocketTask?
    private var orderId: Int?
    private var onUpdate: ((Order) -> Void)?
    private var isConnected = false
    private var shouldReconnect = true

    func connect(orderId: Int, onUpdate: @escaping (Order) -> Void) {
        self.orderId = orderId
        self.onUpdate = onUpdate
        self.shouldReconnect = true
        startWebSocket()
    }

    func disconnect() {
        shouldReconnect = false
        webSocketTask?.cancel(with: .goingAway, reason: nil)
        webSocketTask = nil
    }

    private func startWebSocket() {
        guard let url = URL(string: Constants.WEB_SOCKET_URL) else { return }
        let session = URLSession(configuration: .default)
        webSocketTask = session.webSocketTask(with: url)
        webSocketTask?.resume()
        isConnected = true
        Task {
            await listenForMessages()
        }
    }

    private func listenForMessages() async {
        while isConnected {
            guard let task = webSocketTask else { break }

            do {
                let message = try await task.receive()
                switch message {
                case .string(let text):
                    await handleUpdate(from: text)
                case .data(let data):
                    if let json = String(data: data, encoding: .utf8) {
                        await handleUpdate(from: json)
                    }
                @unknown default:
                    print("Unknown")
                }
            } catch {
                print("WebSocket receive error: \(error.localizedDescription)")
                await handleDisconnect()
            }
        }
    }

    private func handleUpdate(from jsonString: String) async {
        guard let data = jsonString.data(using: .utf8),
              let id = orderId else { return }

        do {
            let orders = try JSONDecoder().decode([Order].self, from: data)
            if let updatedOrder = orders.first(where: { $0.id == id }) {
                await MainActor.run {
                    onUpdate?(updatedOrder)
                }
            }
        } catch {
            print("JSON Decode Error: \(error)")
        }
    }

    private func handleDisconnect() async {
        isConnected = false
        webSocketTask?.cancel()
        webSocketTask = nil

        if shouldReconnect {
            try? await Task.sleep(nanoseconds: 2_000_000_000)
            startWebSocket()
        }
    }
}
