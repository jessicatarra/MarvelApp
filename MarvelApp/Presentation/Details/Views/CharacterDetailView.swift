//
//  CharacterDetailView.swift
//  MarvelApp
//
//  Created by Jessica Tarra on 26/10/24.
//

import SwiftUI

struct CharacterDetailView: View {
    @State private var isFavorite: Bool
    let character: CharacterItem

    init(character: CharacterItem) {
        self.character = character
        self._isFavorite = State(initialValue: character.isFavorite ?? false)
    }

    var body: some View {
        VStack(alignment: .leading) {
            CachedImageView(url: character.thumbnailURL)
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity)

            VStack(alignment: .leading) {
                HStack {
                    Text(character.name ?? "")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                    Spacer()

                    Button(action: {
                        isFavorite.toggle()
                    }) {
                        Image(systemName: isFavorite ? "heart.fill" : "heart")
                            .font(.system(size: 30))
                            .foregroundColor(isFavorite ? .red : .gray)
                    }
                }

                Text(character.safeDescription)
                    .font(.body)
                    .multilineTextAlignment(.leading)
                    .padding(.top, 10.0)
            }.padding([.horizontal, .top], 20)
            Spacer()
        }
        .navigationBarTitle(character.name ?? "", displayMode: .inline)
    }
}

#Preview() {
    CharacterDetailView(character: CharacterItem.dummyCharacter())
}
