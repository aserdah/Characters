//
//  CharacterViewModel.swift
//  Characters
//
//  Created by Ahmed Serdah on 03/01/2025.
//

import Foundation
import Combine

class CharacterViewModel: ObservableObject {
    
    @Published var characters: [CharacterModel] = []
    @Published var loading = false
    @Published var success = false
    @Published var errorInfo:Error?
    @Published var error = false
    
    static let shared = CharacterViewModel()
    
    private var nextPageURL: URL? = URL(string: "https://rickandmortyapi.com/api/character")
    
    func fetchCharacters() {
        guard let url = nextPageURL else { return }
        loading = true
        APIService.fetchApi(url: url) { [weak self] result  in
            DispatchQueue.main.async {
                
                self?.loading = false
                
                switch result {
                case .success(let response):
                    self?.success = true
                    if let results = response.results {
                        print(results)
                        self?.characters.append(contentsOf: results)
                    }
                    if let url = response.info?.next {
                        print(url)
                        self?.nextPageURL = URL(string: url)
                    }
                    
                case .failure(let error):
                    
                    self?.error = true
                    self?.errorInfo = error
                    
                    
                }
            }
        }
        
    }
    
}
