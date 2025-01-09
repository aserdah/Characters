//
//  APIError.swift
//  Characters
//
//  Created by Ahmed Serdah on 09/01/2025.
//

import Foundation

enum APIError: Error, LocalizedError {
    case invalidResponse
    case invalidStatusCode(Int)
    case decodingError(Error)
    case networkError(Error)
    
    var errorDescription: String? {
        switch self {
        case .invalidResponse:
            return "The server returned an invalid response."
        case .invalidStatusCode(let statusCode):
            return "The server returned a bad status code: \(statusCode)."
        case .decodingError(let error):
            return "Failed to decode the response: \(error.localizedDescription)"
        case .networkError(let error):
            return "Network error occurred: \(error.localizedDescription)"
        }
    }
}
