//
//  SplashScreen.swift
//  Saham Task
//
//  Created by Walid Ahmed on 30/06/2025.
//

import SwiftUI

struct SplashScreen: View {
    var body: some View {
        NavigationStack {
            ZStack{
                Color.black
                    .ignoresSafeArea()
                Image("appLogo")
            }
        }
    }
}

#Preview {
    SplashScreen()
}
