//
//  CharacterDetailView.swift
//  Characters
//
//  Created by Ahmed Serdah on 03/01/2025.
//

import SwiftUI

struct CharacterDetailView: View {
    
    @Environment(\.presentationMode) var presentationMode
    var character: CharacterModel?
    
    var body: some View {
        VStack {
            ZStack{
                Color.blue.opacity(0.3)
                AsyncImage(url: URL(string: character?.image ?? ""), content: { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(height: 250)
                        .clipShape(Circle())
                }, placeholder: {
                    ProgressView()
                        .frame(height: 250)
                        .clipShape(Circle())
                    
                })
                .padding()
            }
            .frame(height: 250)
            .cornerRadius(30)
            
            
            HStack{
                Text(character?.name ?? "Name")
                    .font(.largeTitle)
                    .fontWeight(.black)
                
                Spacer()
                ZStack{
                    Color.blue.opacity(0.3)
                    Text( character?.status ?? "Status")
                        .font(.subheadline)
                }
                .frame(width: 100, height: 30)
                .cornerRadius(15)
                
                
            }
            .padding(10)
            HStack{
                
                Text( character?.species ?? "Species")
                    .font(.subheadline)
                Circle()
                    .frame(width: 5, height: 5)
                    .foregroundColor(.black)  
                Text( character?.gender ?? "Gender")
                    .font(.subheadline)
                
                
                Spacer()
                
            }
            .padding(10)
            HStack{
                Text("Location: ")
                    .fontWeight(.bold)
                    .font(.subheadline)
                Text( character?.location.name ?? "")
                    .font(.subheadline)
                
                Spacer()
                
            }
            .padding(10)
            
            Spacer()
        }
        .ignoresSafeArea(.all)
        //  .navigationTitle("Character Detail")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true) // Hide the default back button
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    ZStack {
                        Color.white
                        
                        Image(systemName: "arrow.left")
                    }
                    .frame(width: 40, height: 40)
                    .clipShape(.circle)
                    
                }
            }
        }
    }
}

#Preview {
    CharacterDetailView()
}
