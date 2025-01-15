//
//  CharactersModel.swift
//  Characters
//
//  Created by Ahmed Serdah on 03/01/2025.
//

import Foundation

struct CharactersModel: Decodable, Equatable {
    let info: InfoModel
    let results: [CharacterModel]?
    
    enum CodingKeys: String, CodingKey {
        case info
        case results
    }
}
