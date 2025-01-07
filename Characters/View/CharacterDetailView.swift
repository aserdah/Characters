//
//  CharacterDetailView.swift
//  Characters
//
//  Created by Ahmed Serdah on 03/01/2025.
//

import SwiftUI

struct CharacterDetailView: View {
    var character: CharacterModel?
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: character?.image ?? ""), content: { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250, height: 250)
                    .clipShape(Circle())
            }, placeholder: {
                ProgressView()
                    .frame(width: 250, height: 250)
                    .clipShape(Circle())

            })
                .padding()
            Text(character?.name ?? "")
                .font(.largeTitle)
                .fontWeight(.black)
                .padding(.bottom,30)
            HStack{
                Text("Species: ")
                    .fontWeight(.bold)
                    .font(.subheadline)
                Text( character?.species ?? "")
                    .font(.subheadline)
                
                Spacer()
                
            }
            .padding(.bottom, 10)
            HStack{
                Text("Status: ")
                    .fontWeight(.bold)
                    .font(.subheadline)
                Text( character?.status ?? "")
                    .font(.subheadline)
                
                Spacer()
                
            }
            .padding(.bottom, 10)
            HStack{
                Text("Gender: ")
                    .fontWeight(.bold)
                    .font(.subheadline)
                Text( character?.gender ?? "")
                    .font(.subheadline)
                
                Spacer()
                
            }
            .padding(.bottom, 10)
            Spacer()
        }
        .padding()
        .navigationTitle("Character Detail")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    CharacterDetailView()
}
