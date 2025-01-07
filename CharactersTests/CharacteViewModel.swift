//
//  CharactertViewModelTests.swift
//  CharactersTests
//
//  Created by Ahmed Serdah on 03/01/2025.
//

import Testing
@testable import Characters

struct CharactertViewModelTests {
    
    let viewModel: CharacterViewModel!

     init() {
         self.viewModel = CharacterViewModel()
     }

    @Test("Characters list updates after fetch") func testFetchCharactersUpdatesCharacters() async throws {
        
         
         viewModel.fetchCharacters()
         
        #expect(self.viewModel.characters.count > 0)

     }
    @Test("Fetch handles error gracefully") func testFetchCharactersHandlesError() async throws {
        
         
         viewModel.fetchCharacters()
         
        #expect(self.viewModel.characters.isEmpty)

     }
    

}
