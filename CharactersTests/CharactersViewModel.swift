


import Testing
@testable import TMDBMoviesApp
import Foundation

@Suite("Test MoviesViewModel")
struct MoviesViewModelTests {
    
    @Test func testFetchMovies_withSuccess_expectMovies() async throws {
        // Given
        let mockMovies = Movies.mock()
        let request = try RequestBuilder.movies(page: 1)
        let result = Result<(Data, HTTPURLResponse), Error>.success((try JSONEncoder().encode(mockMovies), HTTPURLResponse()))
        let service = NetworkServiceMock(request: request, result: result)
        let repository = MoviesRepositoryMock(networkService: service, jsonMapper: JsonMapperMock())
        let sut = MoviesViewModel(repository: repository)
        
        // When
        await sut.fetchMovies()
        
        // Then
        #expect(sut.movies == mockMovies.movies, "Comparet the fetched movies with the mock movies")
    }
    
    @Test func testFetchMovies_withFailure_expectError() async throws {
        // Given
        let request = try RequestBuilder.movies(page: 1)
        let error = NetworkServiceMock.MockError.unknown
        let result = Result<(Data, HTTPURLResponse), Error>.failure(error)
        let service = NetworkServiceMock(request: request, result: result)
        let repository = MoviesRepositoryMock(networkService: service, jsonMapper: JsonMapperMock())
        let sut = MoviesViewModel(repository: repository)
        
        // When
        await sut.fetchMovies()
        
        // Then
        #expect(sut.movies == [], "Movies should be empty")
        #expect(sut.networkError != nil, "Error should not be nil")
        #expect(sut.networkError as! NetworkServiceMock.MockError == error, "Error should be the same as the error returned by the network service")
    }
}

