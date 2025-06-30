//
//  OrdersScreen.swift
//  Saham Task
//
//  Created by Walid Ahmed on 30/06/2025.
//

import SwiftUI

struct OrdersScreen: View {
    @State var orderViewModel = OrdersViewModel(ordersService: OrdersServiceImpl(networkService: NetworkManager()))
    
    var body: some View {
        NavigationStack{
            ScrollView{
                if orderViewModel.isLoading{
                    ProgressView()
                }else{
                    LazyVStack(spacing: 14) {
                        ForEach(orderViewModel.orders, id: \.self) { order in
                            OrdersCell(order: order)
                        }
                    }

                }
            }
            .navigationTitle("Orders")
        }
    }
}

#Preview {
    OrdersScreen()
}
