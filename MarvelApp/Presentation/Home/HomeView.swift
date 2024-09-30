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
        NavigationStack {
            ZStack {
                switch viewModel.state {
                case .initial:
                    Text("Initial")
                case .error(let errorMessage):
                    Text("error \(errorMessage)")
                case .empty:
                    Text("empty")
                case .loaded:
                    Text("success")
                case .loading:
                    Text("loading")
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
