//
//  HomeView.swift
//  MarvelApp
//
//  Created by Jessica Tarra on 29/09/24.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = DI.shared.resolve(HomeViewModel.self)

    var body: some View {
        NavigationView {
            ZStack(alignment: .center) {
                switch viewModel.state {
                case .error(let errorMessage):
                    // TODO: add proper error state
                    Text("error \(errorMessage)")
                case .empty:
                    // TODO: add proper empty state
                    Text("empty")
                case .loaded(let characters):
                    ScrollView {
                        ForEach(characters) {
                            character in
                            NavigationLink(destination: CharacterDetailView(character: character)) {
                                CharacterCard(character: character)
                            }.buttonStyle(PlainButtonStyle())
                        }
                    }
                default:
                    ProgressView()
                }
            }
            .navigationTitle("Marvel App")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
