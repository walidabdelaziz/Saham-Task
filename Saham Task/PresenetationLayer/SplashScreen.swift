//
//  SplashScreen.swift
//  Saham Task
//
//  Created by Walid Ahmed on 30/06/2025.
//

import SwiftUI

struct SplashScreen: View {
    @State var navigateToOrders: Bool = false
    var body: some View {
        NavigationStack {
            ZStack{
                Color.black
                    .ignoresSafeArea()
                Image("appLogo")
            }
            .navigationDestination(isPresented: $navigateToOrders) {
                OrdersScreen()
            }
        }
        .onAppear {
            Task {
                try await Task.sleep(nanoseconds: 2_000_000_000)
                navigateToOrders.toggle()
            }
        }
    }
}

#Preview {
    SplashScreen()
}
