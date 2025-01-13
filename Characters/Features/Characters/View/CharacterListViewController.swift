import UIKit
import SwiftUI
import Combine

class CharacterListViewController: UITableViewController {
    @ObservedObject var charactersViewModel = CharacterViewModel.shared
    private var cancellables = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = .none
        setupUI()
        bindViewModel()
        // Start fetching characters when the view loads
        fetchCharacters()
    }
    
    private func setupUI() {
        title = "Characters"
        tableView.register(CharacterTableViewCell.self, forCellReuseIdentifier: "CharacterCell")
    }
    
    private func bindViewModel() {
        charactersViewModel.$characters
            .receive(on: RunLoop.main) // Ensures updates are made on the main thread
            .sink { [weak self] _ in
                self?.tableView.reloadData()
            }
            .store(in: &cancellables)
    }
    
    // Table View Data Source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return charactersViewModel.characters.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterCell", for: indexPath) as? CharacterTableViewCell else {
            return UITableViewCell()
        }
        let character = charactersViewModel.characters[indexPath.row]
        cell.configure(with: character)
        
        // Trigger pagination when reaching the end
        if indexPath.row == charactersViewModel.characters.count - 1 {
            fetchCharacters()
        }
        return cell
    }
    
    // Trigger async fetch when needed
    private func fetchCharacters() {
        // Use a Task to call the async fetch function
        Task {
            await charactersViewModel.fetchCharacters()
        }
    }
    
    // Navigation to detail view
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let character = charactersViewModel.characters[indexPath.row]
        let detailView = CharacterDetailView(character: character)
        let detailController = UIHostingController(rootView: detailView)
        navigationController?.pushViewController(detailController, animated: true)
    }
}

