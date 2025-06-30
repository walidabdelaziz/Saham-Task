//
//  OrdersCell.swift
//  Saham Task
//
//  Created by Walid Ahmed on 30/06/2025.
//

import SwiftUI

struct OrdersCell: View {
    let order: Order
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Text("Order ID")
                Spacer()
                Text("\(order.id ?? 0)")
            }
            HStack {
                Text("Customer")
                Spacer()
                Text(order.customerName ?? "")
            }
            HStack {
                Text("Restaurant")
                Spacer()
                Text(order.restaurant ?? "")
            }

            Text(order.status ?? "")
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(colorForStatus(order.status))
                .cornerRadius(12)
        }
        .font(.title3)
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(12)
        .shadow(radius: 1)
        .padding(.horizontal)
    }
    func colorForStatus(_ status: String?) -> Color {
        switch status?.lowercased() {
        case "preparing":
            return Color.orange
        case "out for delivery":
            return Color.blue
        case "delivered":
            return Color.green
        case "cancelled":
            return Color.red
        default:
            return Color.gray
        }
    }

}
