//
//  ResponseModel.swift
//  Characters
//
//  Created by Ahmed Serdah on 03/01/2025.
//

import Foundation

struct ResponseModel: Codable {
    
    let info : InfoModel?
    let results : [CharacterModel]?
    
}
