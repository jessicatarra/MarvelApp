//
//  CharacterCard.swift
//  MarvelApp
//
//  Created by Jessica Tarra on 26/10/24.
//

import SwiftUI

struct CharacterCard: View {
    let character: CharacterItem

    var body: some View {
        HStack {
            CachedImageView(url: character.thumbnailURL)
                .frame(height: 250)
                .aspectRatio(2 / 1, contentMode: .fit)

            VStack(alignment: .leading, spacing: 80.0) {
                VStack(alignment: .leading) {
                    Text(character.name ?? "")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.bottom, 20)

                    Text(character.safeDescription)
                        .font(.caption)
                        .lineLimit(3)
                }

                HStack {
                    Text("More info")
                        .font(.caption)
                        .bold()
                    Spacer()
                    Image(systemName: "arrow.forward")
                        .font(.system(size: 15))
                }.padding(.top, 40)
            }.padding(.trailing, 10)
        }
        .clipShape(RoundedRectangle(cornerRadius: 24))
        .padding([.horizontal, .bottom], 20)
    }
}

#Preview {
    CharacterCard(character: CharacterItem.dummyCharacter())
}
