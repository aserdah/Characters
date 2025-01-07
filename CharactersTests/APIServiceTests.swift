//
//  CharacterViewModelTests.swift
//  CharactersTests
//
//  Created by Ahmed Serdah on 05/01/2025.
//

import XCTest
@testable import Characters

final class CharacterViewModelTests: XCTestCase {
    
    
    func testFetchCharactersWithSuccess() {
        
        let expectation = XCTestExpectation(description: "Fetch characters succeeds")
        let url = URL(string: "https://rickandmortyapi.com/api/character")!
        APIService.fetchApi(url: url) { result  in
            
            switch result {
            case .success(let response):
                XCTAssertFalse(((response.results?.isEmpty) != nil), "Results should not be empty")
                expectation.fulfill()
                
            case .failure(let error):
                
                XCTFail("Expected success but got failure")
                
            }
            
        }
        wait(for: [expectation], timeout: 5.0)

    }
    
    func testFetchCharactersWithFailure() {
        
        let expectation = XCTestExpectation(description: "Fetch characters succeeds")
        let url = URL(string: "https://rickandmortyapi.com/api/charrss")!
        APIService.fetchApi(url: url) { result  in
            
            switch result {
            case .success(let response):
                XCTFail("Expected Error but got success")
                
            case .failure(let error):
                XCTAssertNotNil(error, "Not nil Error")
                expectation.fulfill()

                
            }
            
        }
        wait(for: [expectation], timeout: 5.0)

    }
    
    
    
    
}
