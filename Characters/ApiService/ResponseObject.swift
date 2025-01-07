//
//  ResponseObject.swift
//  Characters
//
//  Created by Ahmed Serdah on 03/01/2025.
//

import Foundation

import Foundation
class ResponseObject<T: Codable,E: Codable>: Codable {
    
    public var status: String?
    public var message: String?
    public var code: Int?
    private var data: T?
    private var errors: E?
    
    var result: Result {
//        guard status == "success" else { return
//            
//            .error(errors)
//            
//        }
        
        guard let modelData = data else { return
            
            .error(errors)
            
        }
        
        return .value(modelData)
    }
    
    enum Result {
        
        case error(E?)
        case value(T?)
    }
    
}
