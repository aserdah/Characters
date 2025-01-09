import XCTest
@testable import Characters

@MainActor
final class CharacterViewModelTests: XCTestCase {
    
    var viewModel: CharacterViewModel!
    
    override func setUp() {
        super.setUp()
        viewModel = CharacterViewModel()
    }
    
    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }
    
    func testFetchCharactersUpdatesCharacters() async {
        // Arrange: initial character count should be zero
        let initialCount = viewModel.characters.count
        
        // Act: fetch characters
        await viewModel.fetchCharacters()
        
        // Assert: the character list should be updated and non-empty
        XCTAssertGreaterThan(viewModel.characters.count, initialCount, "Characters list should update after fetch")
    }
    
    func testFetchCharactersHandlesError() async {
        // Arrange: force an error by setting an invalid URL
        viewModel.nextPageURL = URL(string: "https://rickandmortyapi.com/api/characterxxx")
        
        // Act: attempt to fetch characters
        await viewModel.fetchCharacters()
        
        // Assert: check if error flag is set
        XCTAssertTrue(viewModel.error, "Error flag should be set when fetch fails")
        
        // Assert: check if error information is populated
        XCTAssertNotNil(viewModel.errorInfo, "Error information should be populated when fetch fails")
        
        // Assert: check if the characters list is still empty
        XCTAssertTrue(viewModel.characters.isEmpty, "Characters list should remain empty on fetch failure")
    }
}

