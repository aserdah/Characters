//
//  Characters+Mock.swift
//  CharactersTests
//
//  Created by Ahmed Serdah on 13/01/2025.
//

import Foundation
@testable import Characters

extension CharactersModel {
    static func mock(
        info: InfoModel = .mock(),
        results: [CharacterModel] = [.mock()]
    ) -> CharactersModel {
        CharactersModel(
            info: info,
            results: results
        )
    }
}

extension CharacterModel {
    static func mock(
        id: Int = 1,
        name: String = "name+Mock",
        status: String = "status+Mock",
        species: String = "species+Mock",
        type: String = "type+Mock",
        gender: String = "gender+Mock",
        location: LocationModel = .mock(),
        image: String = "image+Mock"
        
    ) -> CharacterModel {
        CharacterModel(
            id: id,
            name:name,
            status: status,
            species: species,
            type: type,
            gender: gender,
            location: location,
            image: image
            
        )
    }
}

extension InfoModel {
    static func mock(
        next: String = "next+Mock"
    ) -> InfoModel {
        InfoModel(
            next: next
        )
    }
}

extension LocationModel {
    static func mock(
        name: String = "name+Mock"
    ) -> LocationModel {
        LocationModel(
            name: name
        )
    }
}

// Encodable extension
protocol CustomEncodable: Encodable {}

extension CharactersModel: @retroactive Encodable {
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(info, forKey: .info)
        try container.encode(results, forKey: .results)
        
    }
}

extension InfoModel: @retroactive Encodable {
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(next, forKey: .next)
        
    }
}

extension LocationModel: @retroactive Encodable {
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        
    }
}

extension CharacterModel: @retroactive Encodable {
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(status, forKey: .status)
        try container.encode(species, forKey: .species)
        try container.encode(type, forKey: .type)
        try container.encode(gender, forKey: .gender)
        try container.encode(location, forKey: .location)
        try container.encode(image, forKey: .image)
        
    }
}
