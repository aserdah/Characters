//
//  CharacterViewModel.swift
//  Characters
//
//  Created by Ahmed Serdah on 03/01/2025.
//

import Foundation

protocol MoviesViewModelType {
    func fetchCharacters() async
}


final class CharacterViewModel: ObservableObject {
    
    // MARK: - Properties
    
    @Published private(set) var characters: [CharacterModel] = [] // Make it @Published
    @Published private(set) var loading: Bool = false
    @Published private(set) var error: Bool = false
    @Published private(set) var networkError: Error?
    
    private var url: String = "https://rickandmortyapi.com/api/character"
    private let repository: CharactersRepositoryType
    static let shared = CharacterViewModel()

    // MARK: - Initializer
    init(repository: CharactersRepositoryType = CharactersRepository()) {
        self.repository = repository
    }
}

extension CharacterViewModel: MoviesViewModelType {
    // MARK: - Public Methods
    
    // Get characters from the repository and set the characters property
    @MainActor
    func fetchCharacters() async {
        // Set the loading state to true before fetching characters
        // and set it back to false after fetching characters
        loading = true
        defer { loading = false }
        
        do {
            // Fetch movies from the repository
            let response = try await repository.characters(url)
                        if let results = response.results {
                            self.characters.append(contentsOf: results)
                        }
            
                        if let nextPageURL = response.info.next {
                            self.url = nextPageURL
                        }
        } catch {
            self.error = true
            self.networkError = error
            print("An error occurred while fetching characters: \(error)")
        }
    }
}
