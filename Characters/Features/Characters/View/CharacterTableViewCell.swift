//
//  CharacterTableViewCell.swift
//  Characters
//
//  Created by Ahmed Serdah on 03/01/2025.
//

import UIKit
import SwiftUI

class CharacterTableViewCell: UITableViewCell {
    private let mainController = UIHostingController(rootView: CharacterRowView(character: nil))
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupMainController()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupMainController() {
        guard let contentView = mainController.view else { return }
        contentView.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(contentView)
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)
        ])
    }
    
    func configure(with character: CharacterModel) {
        mainController.rootView = CharacterRowView(character: character)
    }
}
