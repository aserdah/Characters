//
//  CharactersRepository.swift
//  Characters
//
//  Created by Ahmed Serdah on 12/01/2025.
//

import Foundation


protocol CharactersRepositoryType {
    func characters(_ url: String) async throws -> CharactersModel
}

final class CharactersRepository {
    // MARK: - Properties
    private let networkService: NetworkServiceType
    private let jsonMapper: JSONMapperType
    
    init(
        networkService: NetworkServiceType = NetworkService(), // Inject the network service
        jsonMapper: JSONMapperType = JSONMapper() // Inject the JSON mapper
    ) {
        self.networkService = networkService
        self.jsonMapper = jsonMapper
    }
}

extension CharactersRepository: CharactersRepositoryType {
    func characters(_ url: String) async throws -> CharactersModel {
        // 1. Create a request to fetch Characters
        let request = try RequestBuilder.createRequest(from: url)
        
        // 2. Execute the request
        let (data, _) = try await networkService.execute(request)
        
        // 3. Decode the response
        return try jsonMapper.decode(CharactersModel.self, from: data)
    }
}

