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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        
            .navigationBarBackButtonHidden()
    }
}

#Preview {
    OrdersScreen()
}
