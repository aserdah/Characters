//
//  JSONMapper.swift
//  Characters
//
//  Created by Ahmed Serdah on 12/01/2025.
//

import Foundation

protocol JSONMapperType {
    func decode<T: Decodable>(_ type: T.Type, from data: Data) throws -> T
}

final class JSONMapper: JSONMapperType {
    func decode<T: Decodable>(_ type: T.Type, from data: Data) throws -> T {
        try JSONDecoder().decode(type, from: data)
    }
}
