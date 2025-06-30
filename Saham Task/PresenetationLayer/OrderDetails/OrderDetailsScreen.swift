//
//  OrderDetailsScreen.swift
//  Saham Task
//
//  Created by Walid Ahmed on 30/06/2025.
//

import SwiftUI

struct OrderDetailsScreen: View {
    let selectedOrder: Order
    var body: some View {
        Text(selectedOrder.customerName ?? "")
    }
}

#Preview {
    OrderDetailsScreen(selectedOrder: Order())
}
