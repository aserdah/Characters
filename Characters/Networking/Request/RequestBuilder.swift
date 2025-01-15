//
//  RequestBuilder.swift
//  Characters
//
//  Created by Ahmed Serdah on 12/01/2025.
//

import Foundation


struct RequestBuilder {
    enum HttpMethod: String {
        case get = "GET"
        case post = "POST"
        case put = "PUT"
        case delete = "DELETE"
        case patch = "PATCH"
    }
    
    let scheme: String
    let path: String
    let baseUrl: String
    let method: HttpMethod
    let queryItems: [URLQueryItem]
    
    init(
        scheme: String = "https",
        path: String,
        baseUrl: String,
        method: HttpMethod = .get,
        queryItems: [URLQueryItem] = []
    ) {
        self.scheme = scheme
        self.path = path
        self.baseUrl = baseUrl
        self.method = method
        self.queryItems = queryItems
    }
    
    // Create a URL request from the request builder
    func urlRequest() throws -> URLRequest {
        var urlComponents = URLComponents()
        urlComponents.scheme = scheme
        urlComponents.host = baseUrl
        urlComponents.path = "/" + path
        urlComponents.queryItems = queryItems
        
        guard let url = urlComponents.url else {
            throw URLError(.badURL)
        }
        
        return URLRequest(url: url)
    }
}
