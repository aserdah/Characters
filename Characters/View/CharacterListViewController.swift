//
//  CharacterListViewController.swift
//  Characters
//
//  Created by Ahmed Serdah on 03/01/2025.
//

import UIKit
import SwiftUI
import Combine

class CharacterListViewController: UITableViewController {
    @ObservedObject var charactersViewModel = CharacterViewModel.shared
    private var cancellables = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindViewModel()
        //charactersViewModel.fetchCharacters()
    }
    
    private func setupUI() {
        title = "Characters"
        tableView.register(CharacterTableViewCell.self, forCellReuseIdentifier: "CharacterCell")
    }
    
    private func bindViewModel() {
        charactersViewModel.$characters
            .receive(on: DispatchQueue.main)
            .sink { [weak self] characters in
                      print("Characters updated: \(characters.count)")
                
                      self?.tableView.reloadData()
                  }
                  .store(in: &cancellables)
    }
    
    // Table View Data Source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        print("Number of rows: \(charactersViewModel.characters.count)")
        
         return charactersViewModel.characters.count    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterCell", for: indexPath) as? CharacterTableViewCell else {
            return UITableViewCell()
        }
        let character = charactersViewModel.characters[indexPath.row]
        cell.configure(with: character)
        
        // Trigger pagination when reaching the end
        if indexPath.row == charactersViewModel.characters.count - 1 {
            charactersViewModel.fetchCharacters()
        }
        return cell
    }
    
    // Navigation to detail view
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let character = charactersViewModel.characters[indexPath.row]
        let detailView = CharacterDetailView(character: character)
        let detailController = UIHostingController(rootView: detailView)
        navigationController?.pushViewController(detailController, animated: true)
    }
}
