//
//  OrdersService.swift
//  Saham Task
//
//  Created by Walid Ahmed on 30/06/2025.
//

protocol OrdersService {
    func getOrders() async throws -> OrdersResponse
}

class OrdersServiceImpl: OrdersService {
    private let networkService: NetworkService

    init(networkService: NetworkService) {
        self.networkService = networkService
    }

    func getOrders() async throws -> OrdersResponse {
        return try await networkService.request(
            method: .get,
            url: Constants.ORDERS,
            headers: [:],
            params: nil,
            of: OrdersResponse.self
        )
    }
}
