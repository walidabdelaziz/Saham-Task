//
//  Orders.swift
//  Saham Task
//
//  Created by Walid Ahmed on 30/06/2025.
//

struct OrdersResponse: Codable {
    var data: [Order]?
    
    enum CodingKeys: String, CodingKey {
        case data = "data"
    }
}

struct Order: Codable {
    var id: Int?
    var customerName: String?
    var restaurant: String?
    var status: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case customerName = "customerName"
        case restaurant = "restaurant"
        case status = "status"
    }
}
