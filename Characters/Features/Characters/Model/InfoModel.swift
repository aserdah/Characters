//
//  InfoModel.swift
//  Characters
//
//  Created by Ahmed Serdah on 03/01/2025.
//

import Foundation

struct InfoModel: Decodable, Equatable {
    
    let next: String?
    
    enum CodingKeys: String, CodingKey {
        case next
    }
    
}
