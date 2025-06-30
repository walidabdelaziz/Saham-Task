//
//  OrdersViewModel.swift
//  Saham Task
//
//  Created by Walid Ahmed on 30/06/2025.
//
import SwiftUI

@Observable class OrdersViewModel {
    var orders: [Order] = []
    var isLoading: Bool = false

    private let ordersService: OrdersService
    
    init(ordersService: OrdersService) {
        self.ordersService = ordersService
    }
    @MainActor
    func getOrders() async {
        isLoading = true
        do {
            let result = try await ordersService.getOrders()
            orders = result
        } catch {
            print("Failed to fetch orders: \(error)")
        }
        isLoading = false
    }
}
