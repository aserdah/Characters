//
//  JsonMapper+Mock.swift
//  CharactersTests
//
//  Created by Ahmed Serdah on 13/01/2025.
//

import Foundation
@testable import Characters

class JsonMapperMock: JSONMapperType {
    func decode<T: Decodable>(_ type: T.Type, from data: Data) throws -> T {
        try JSONDecoder().decode(type, from: data)
    }
}
