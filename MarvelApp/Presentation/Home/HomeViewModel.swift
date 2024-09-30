//
//  HomeViewModel.swift
//  MarvelApp
//
//  Created by Jessica Tarra on 29/09/24.
//

import DataSource
import Entities
import Foundation
import UseCaseProtocol

@MainActor
final class HomeViewModel: ViewModel {
    private let getCharactersUseCase: any GetCharacterUseCaseProtocol

    private var limit = APIConstants.defaultLimit
    private var currentOffset = 0
    private var totalCount = 0
    private let debounceTime: Int

    @Published var characters: [CharacterItem] = []
    @Published var searchText = ""
    @Published var debouncedSearchText = ""

    init(getCharactersUseCase: any GetCharacterUseCaseProtocol, debounceTime: Int = 700) {
        self.getCharactersUseCase = getCharactersUseCase
        self.debounceTime = debounceTime
        super.init()

        Task {
            await loadCharacters()
        }
    }
}

extension HomeViewModel {
    func loadCharacters(from offset: Int = 0) async {
        state = .loading
        let result = await getCharactersUseCase.execute(with: GetCharactersParams(offset: offset))

        switch result {
        case .success(let data):
            characters.append(contentsOf: data.map(CharacterItem.init))

            if characters.isEmpty {
                state = .empty
            } else {
                state = .loaded
            }
        case .failure(let err):
            state = .error(err.localizedDescription)
        }
    }
}
