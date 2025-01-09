//
//  InfoModel.swift
//  Characters
//
//  Created by Ahmed Serdah on 03/01/2025.
//

import Foundation
struct InfoModel : Decodable {
    let count : Int
    let pages : Int
    let next : String?
    let prev : String?
    
}
