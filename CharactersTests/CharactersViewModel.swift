


import Testing
@testable import Characters
import Foundation

@Suite("Test CharactersViewModel")
struct CharactersViewModelTests {
    
    @Test func testFetchCharacters_withSuccess_expectCharacters() async throws {
        // Given
        let mockCharacters = CharactersModel.mock()
        let request = try RequestBuilder.createRequest(from: "https://rickandmortyapi.com/api/character")
        let result = Result<(Data, HTTPURLResponse), Error>.success((try JSONEncoder().encode(mockCharacters), HTTPURLResponse()))
        let service = NetworkServiceMock(request: request, result: result)
        let repository = CharactersRepositoryMock(networkService: service, jsonMapper: JsonMapperMock())
        let sut = CharacterViewModel(repository: repository)
        
        // When
        await sut.fetchCharacters()
        
        // Then
        #expect(sut.characters == mockCharacters.results, "Comparet the fetched characters with the mock characters")
    }
    
    @Test func testFetchCharacters_withFailure_expectError() async throws {
        // Given
        let request = try RequestBuilder.createRequest(from: "http://")
        let error = NetworkServiceMock.MockError.unknown
        let result = Result<(Data, HTTPURLResponse), Error>.failure(error)
        let service = NetworkServiceMock(request: request, result: result)
        let repository = CharactersRepositoryMock(networkService: service, jsonMapper: JsonMapperMock())
        let sut = CharacterViewModel(repository: repository)
        
        // When
        await sut.fetchCharacters()
        
        // Then
        #expect(sut.characters == [], "Characters should be empty")
        #expect(sut.networkError != nil, "Error should not be nil")
        #expect(sut.networkError as! NetworkServiceMock.MockError == error, "Error should be the same as the error returned by the network service")
    }
}

