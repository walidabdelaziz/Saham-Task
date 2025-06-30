//
//  OrdersScreen.swift
//  Saham Task
//
//  Created by Walid Ahmed on 30/06/2025.
//

import SwiftUI

struct OrdersScreen: View {
    @State var selectedOrder: Order?
    @State var orderViewModel = OrdersViewModel(ordersService: OrdersServiceImpl())
    
    var body: some View {
        ScrollView{
            if orderViewModel.isLoading{
                ProgressView()
            }else{
                LazyVStack(spacing: 14) {
                    ForEach(orderViewModel.orders, id: \.self) { order in
                        OrdersCell(order: order)
                            .onTapGesture {
                                selectedOrder = order
                            }
                    }
                }
            }
        }
        .navigationBarBackButtonHidden()
        .navigationTitle("Orders")
        .navigationBarTitleDisplayMode(.large)
        .navigationDestination(item: $selectedOrder) { order in
            OrderDetailsScreen(selectedOrder: order)
        }
        .onAppear {
            Task{
                await orderViewModel.getOrders()
            }
        }
    }
}

#Preview {
    OrdersScreen()
}
