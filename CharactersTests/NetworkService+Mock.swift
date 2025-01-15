//
//  NetworkService+Mock.swift
//  CharactersTests
//
//  Created by Ahmed Serdah on 13/01/2025.
//

import Foundation
@testable import Characters

class NetworkServiceMock: NetworkServiceType {
    enum MockError: Error {
        case unknown
    }
    
    private(set) var request: URLRequest
    private let result: Result<(Data, HTTPURLResponse), Error>
    
    init(
        request: URLRequest,
        result: Result<(Data, HTTPURLResponse), Error>
    ) {
        self.request = request
        self.result = result
    }
    
    func execute(_ request: URLRequest) async throws -> (Data, HTTPURLResponse) {
        self.request = request
        
        switch result {
        case .success((let data, let response)):
            return (data, response)
        case .failure(let error):
            throw error
        }
    }
}
