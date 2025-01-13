//
//  CharacterListViewControllerWrapper.swift
//  Characters
//
//  Created by Ahmed Serdah on 04/01/2025.
//

import SwiftUI
import UIKit

struct CharacterListViewControllerWrapper: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> CharacterListViewController {
        return CharacterListViewController()
    }
    
    func updateUIViewController(_ uiViewController: CharacterListViewController, context: Context) {
        // Handle updates if needed
    }
}
