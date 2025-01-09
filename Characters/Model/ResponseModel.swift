//
//  ResponseModel.swift
//  Characters
//
//  Created by Ahmed Serdah on 03/01/2025.
//

import Foundation

struct ResponseModel: Decodable {
    
    let info : InfoModel
    let results : [CharacterModel]?
    
}
