//
//  CharactersRepository+Mock.swift
//  CharactersTests
//
//  Created by Ahmed Serdah on 13/01/2025.
//

import Foundation
@testable import Characters

class CharactersRepositoryMock: CharactersRepositoryType {
    private let networkService: NetworkServiceType
    private let jsonMapper: JSONMapperType
    
    init(
        networkService: NetworkServiceType,
        jsonMapper: JSONMapperType
    ) {
        self.networkService = networkService
        self.jsonMapper = jsonMapper
    }
    
    func characters(_ url: String) async throws -> CharactersModel {
        // 1. Create a request to fetch Characters
        let request = try RequestBuilder.createRequest(from: url)
        
        // 2. Execute the request
        let (data, _) = try await networkService.execute(request)
        
        // 3. Decode the response
        return try jsonMapper.decode(CharactersModel.self, from: data)
    }
}

