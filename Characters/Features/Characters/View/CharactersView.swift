//
//  ContentView.swift
//  Characters
//
//  Created by Ahmed Serdah on 03/01/2025.
//

import SwiftUI

struct CharactersView: View {
    @ObservedObject var charactersViewModel = CharacterViewModel.shared
    
    var body: some View {
        NavigationStack{
            ZStack{
                VStack{
                    Text("Character List")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                    CharacterListViewControllerWrapper()
                    
                }
                if charactersViewModel.loading == true {
                    
                    CustomProgressView()
                }
            }
            .navigationBarTitle("")
            
        }
        .accentColor(.black)
    }
}

#Preview {
    CharactersView()
}
