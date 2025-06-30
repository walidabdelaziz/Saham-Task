//
//  OrderDetailsScreen.swift
//  Saham Task
//
//  Created by Walid Ahmed on 30/06/2025.
//

import SwiftUI

struct OrderDetailsScreen: View {
    let selectedOrder: Order
    @State var orderDetilasViewModel = OrderDetailsViewModel(orderDetailsService: OrderDetailsServiceImpl())

    var body: some View {
        ScrollView{
            if orderDetilasViewModel.isLoading{
                ProgressView()
            }else{
                OrdersCell(order: orderDetilasViewModel.order)
                    .padding(.vertical)
            }
        }
        .onAppear {
                Task{
                    await orderDetilasViewModel.getOrderDetails(id: selectedOrder.id ?? 0)
                }
            }
    }
}

#Preview {
    OrderDetailsScreen(selectedOrder: Order())
}
