//
//  ContentView.swift
//  Characters
//
//  Created by Ahmed Serdah on 03/01/2025.
//

import SwiftUI

struct ContentView: View {
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
            .task {
                charactersViewModel.fetchCharacters()
            }
            .alert(isPresented: $charactersViewModel.error) {
                
                Alert(title: Text("Oops!"), message: Text(charactersViewModel.errorInfo?.localizedDescription ?? "Error"), dismissButton: .default(Text("Got it!")))
            }
            .navigationBarTitle("")

        }
        .accentColor(.black)
    }
}

#Preview {
    ContentView()
}
