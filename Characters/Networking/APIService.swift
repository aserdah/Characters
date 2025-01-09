//
//  APIService.swift
//  Characters
//
//  Created by Ahmed Serdah on 03/01/2025.
//

import Foundation


struct APIService {
    static func fetchData(url: URL) async throws -> ResponseModel {
        do {
            // Perform the network request
            let (data, response) = try await URLSession.shared.data(from: url)
            
            // Validate the HTTP response
            guard let httpResponse = response as? HTTPURLResponse else {
                throw APIError.invalidResponse
            }
            
            guard (200...299).contains(httpResponse.statusCode) else {
                throw APIError.invalidStatusCode(httpResponse.statusCode)
            }
            
            // Decode the data
            do {
                let decodedData = try JSONDecoder().decode(ResponseModel.self, from: data)
                return decodedData
            } catch {
                throw APIError.decodingError(error)
            }
        } catch {
            throw APIError.networkError(error)
        }
    }
}
