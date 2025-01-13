//
//  CharacterRowView.swift
//  Characters
//
//  Created by Ahmed Serdah on 03/01/2025.
//

import SwiftUI

struct CharacterRowView: View {
    
    @State private var backgroundColor = Color.random()
    var character: CharacterModel?
    
    var body: some View {
        ZStack{
            Color(backgroundColor).opacity(0.05)
            HStack {
                AsyncImage(url: URL(string: character?.image ?? ""), content: { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 80)
                        .cornerRadius(10)
                    
                }, placeholder: {
                    ProgressView()
                        .frame(width: 80, height: 80)
                        .cornerRadius(10)
                    
                })
                
                VStack(alignment: .leading) {
                    Text(character?.name ?? "Name")
                        .font(.subheadline)
                        .fontWeight(.bold)
                    Text(character?.species ?? "Species")
                        .font(.subheadline)
                    Spacer()
                    
                }
                Spacer()
            }
            .padding()
            
        }
        .frame(height: 100)
        .overlay(RoundedRectangle(cornerRadius:22).stroke(Color(.systemGray4), lineWidth: 1))
        .cornerRadius(10)
        .padding(.horizontal)
        .padding(.bottom)
        
    }
}

#Preview {
    CharacterRowView()
}
