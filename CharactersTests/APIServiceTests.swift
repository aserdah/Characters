//
//  APIServiceTests.swift
//  CharactersTests
//
//  Created by Ahmed Serdah on 05/01/2025.
//

import XCTest
@testable import Characters

final class APIServiceTests: XCTestCase {
    
    func testFetchCharactersWithSuccess() async throws {
        // Arrange
        let url = URL(string: "https://rickandmortyapi.com/api/character")!
        
        // Act
        do {
            let response = try await APIService.fetchData(url: url)
            
            // Assert
            XCTAssertFalse(response.results?.isEmpty ?? true, "Results should not be empty")
        } catch {
            XCTFail("Expected success but got failure: \(error)")
        }
    }
    
    func testFetchCharactersWithFailure() async throws {
        // Arrange
        let url = URL(string: "https://rickandmortyapi.com/api/characterxxx")!
        
        // Act
        do {
            _ = try await APIService.fetchData(url: url)
            XCTFail("Expected failure but got success")
        } catch {
            // Assert
            XCTAssertNotNil(error, "Error should not be nil")
        }
    }
}

