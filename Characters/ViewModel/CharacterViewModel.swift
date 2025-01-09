//
//  CharacterViewModel.swift
//  Characters
//
//  Created by Ahmed Serdah on 03/01/2025.
//

import Foundation
import Combine

@MainActor
class CharacterViewModel: ObservableObject {
    
    @Published var characters: [CharacterModel] = []
    @Published var loading = false
    @Published var success = false
    @Published var errorInfo: Error?
    @Published var error = false
    
    static let shared = CharacterViewModel()
    
    var nextPageURL: URL? = URL(string: "https://rickandmortyapi.com/api/character")
    
    func fetchCharacters() async {
        guard let url = nextPageURL else { return }
        
        loading = true
        error = false
        errorInfo = nil
        success = false
        
        do {
            let response = try await APIService.fetchData(url: url)
            self.success = true
            
            if let results = response.results {
                self.characters.append(contentsOf: results)
            }
            
            if let url = response.info.next {
                self.nextPageURL = URL(string: url)
            }
            
        } catch {
            self.error = true
            self.errorInfo = error
        }
        
        loading = false
    }
}
