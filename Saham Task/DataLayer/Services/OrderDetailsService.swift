//
//  OrderDetailsService.swift
//  Saham Task
//
//  Created by Walid Ahmed on 30/06/2025.
//

protocol OrderDetailsService {
    func getOrderDetails(id: Int) async throws -> Order
}

class OrderDetailsServiceImpl: OrderDetailsService {
    private let networkService: NetworkService

    init(networkService: NetworkService = NetworkManager()) {
        self.networkService = networkService
    }

    func getOrderDetails(id: Int) async throws -> Order {
        return try await networkService.request(
            method: .get,
            url: "\(Constants.ORDERS)/\(id)",
            headers: [:],
            params: nil,
            of: Order.self
        )
    }
}
