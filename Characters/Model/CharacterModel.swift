//
//  CharacterModel.swift
//  Characters
//
//  Created by Ahmed Serdah on 03/01/2025.
//

import Foundation
struct CharacterModel : Decodable {
    let id : Int
    let name : String
    let status : String
    let species : String
    let type : String
    let gender : String
    let origin : OriginModel
    let location : LocationModel
    let image : String
    let episode : [String]
    let url : String
    let created : String
}
