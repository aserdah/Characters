//
//  NetworkService.swift
//  Characters
//
//  Created by Ahmed Serdah on 12/01/2025.
//

import Foundation


protocol NetworkServiceType {
    func execute(_ request: URLRequest) async throws -> (Data, HTTPURLResponse)
}

class NetworkService {
   
}

extension NetworkService: NetworkServiceType {
    func execute(_ request: URLRequest) async throws -> (Data, HTTPURLResponse) {
        // Execute the request
        let (data, response) = try await URLSession.shared.data(for: request)
        
        // Ensure the response is an HTTP response
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }
        
        // Ensure the status code is in the 200..<300 range
        guard 200..<300 ~= httpResponse.statusCode else {
            throw NetworkError.invalidStatusCode(httpResponse.statusCode)
        }
        
        // Return the data and HTTP response
        return (data, httpResponse)
    }
}
