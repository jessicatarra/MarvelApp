//
//  Untitled.swift
//  MarvelApp
//
//  Created by Jessica Tarra on 29/09/24.
//

import Foundation

@MainActor
class ViewModel: ObservableObject {
    @Published var state: ViewState = .initial
}

enum ViewState: Equatable {
    case initial, loading, error(String), loaded, empty
}
