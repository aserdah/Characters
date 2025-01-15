//
//  LocationModel.swift
//  Characters
//
//  Created by Ahmed Serdah on 03/01/2025.
//

import Foundation

struct LocationModel: Decodable, Equatable {
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case name
    }
}
