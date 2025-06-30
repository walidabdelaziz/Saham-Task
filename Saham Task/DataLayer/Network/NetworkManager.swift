//
//  NetworkManager.swift
//  Saham Task
//
//  Created by Walid Ahmed on 30/06/2025.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

protocol NetworkService {
    func request<T: Decodable>(
        method: HTTPMethod,
        url: String,
        headers: [String: String],
        params: [String: Any]?,
        of type: T.Type
    ) async throws -> T
}

actor NetworkManager: NetworkService {
    func request<T: Decodable>(
        method: HTTPMethod,
        url: String,
        headers: [String: String],
        params: [String: Any]?,
        of type: T.Type
    ) async throws -> T {

        guard let requestURL = URL(string: url) else {
            throw URLError(.badURL)
        }

        var request = URLRequest(url: requestURL)
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = headers

        if let params = params {
            request.httpBody = try JSONSerialization.data(withJSONObject: params)
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        }

        let (data, response) = try await URLSession.shared.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse,
              200..<300 ~= httpResponse.statusCode else {
            throw URLError(.badServerResponse)
        }

        print("🧾 Response Body: \(try JSONDecoder().decode(T.self, from: data))")
        return try JSONDecoder().decode(T.self, from: data)
    }
}
