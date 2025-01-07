//
//  CharacterRowView.swift
//  Characters
//
//  Created by Ahmed Serdah on 03/01/2025.
//

import SwiftUI

struct CharacterRowView: View {
    var character: CharacterModel?
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: character?.image ?? ""), content: { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
            }, placeholder: {
                ProgressView()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())

            })

            VStack(alignment: .leading) {
                Text(character?.name ?? "")
                    .font(.headline)
                Text(character?.species ?? "")
                    .font(.subheadline)
            }
            Spacer()
        }
        .padding()
    }
}

#Preview {
    CharacterRowView()
}
