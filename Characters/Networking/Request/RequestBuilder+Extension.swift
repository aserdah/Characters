//
//  RequestBuilder+Extension.swift
//  Characters
//
//  Created by Ahmed Serdah on 12/01/2025.
//

import Foundation

extension RequestBuilder {
    // Method to create a URLRequest using the full URL
    static func createRequest(from fullUrl: String) throws -> URLRequest {
        guard let url = URL(string: fullUrl) else {
            throw URLError(.badURL)
        }
        
        return URLRequest(url: url)
    }
}
