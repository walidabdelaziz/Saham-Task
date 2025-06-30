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
    
    init(orderDetailsService: OrderDetailsService) {
        self.orderDetailsService = orderDetailsService
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
}
