//
//  OrderDetailsViewModel.swift
//  Saham Task
//
//  Created by Walid Ahmed on 30/06/2025.
//

import SwiftUI

@Observable class OrderDetailsViewModel {
    var order: Order = Order()
    var isLoading: Bool = false

    private let orderDetailsService: OrderDetailsService
    private let webSocketUseCase: OrdersWebSocketUseCase

    
    init(orderDetailsService: OrderDetailsService, webSocketUseCase: OrdersWebSocketUseCase = OrdersWebSocketUseCaseImpl()) {
        self.orderDetailsService = orderDetailsService
        self.webSocketUseCase = webSocketUseCase
    }

    @MainActor
    func getOrderDetails(id: Int) async {
        isLoading = true
        do {
            let result = try await orderDetailsService.getOrderDetails(id: id)
            order = result
        } catch {
            print("Failed to fetch order: \(error)")
        }
        isLoading = false
    }

    func connectToWebSocket(orderId: Int) {
        webSocketUseCase.connect(orderId: orderId) { [weak self] updatedOrder in
            guard let self = self else{return}
            self.order = updatedOrder
        }
    }
    func disconnectFromWebSocket() {
        webSocketUseCase.disconnect()
    }
}


