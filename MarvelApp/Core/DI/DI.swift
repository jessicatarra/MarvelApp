//
//  DI.swift
//  MarvelApp
//
//  Created by Jessica Tarra on 29/09/24.
//

import CoreData
import DataSource
import Foundation
import Moya
import Repositories
import RepositoryProtocol
import Swinject
import UseCaseProtocol
import UseCases

// Dependency Injection Resolver
class DI {
    static let shared = DI()

    private var container = Container()

    @MainActor func injectModules() {
        // DataSources
        container.register(MoyaProvider<MarvelRoute>.self) { _ in
            // impl
            MoyaProvider<MarvelRoute>(plugins: [NetworkLoggerPlugin()])

            // sample data
            //  MoyaProvider<MarvelRoute>(stubClosure: MoyaProvider.immediatelyStub)
        }.inObjectScope(.container)

        container.register(CharacterRemoteDataSourceProtocol.self) { resolver in
            CharacterRemoteDataSource(marvelProvider: resolver.resolve(MoyaProvider<MarvelRoute>.self)!)
        }.inObjectScope(.container)

        // Repositories
        container.register(CharacterRepositoryProtocol.self) { resolver in
            CharacterRepository(charactersDataSource: resolver.resolve(CharacterRemoteDataSourceProtocol.self)!)
        }.inObjectScope(.container)

        // UseCases
        container.register(GetCharacterUseCaseProtocol.self) { resolver in
            let characterRepository = resolver.resolve(CharacterRepositoryProtocol.self)!
            return GetCharacterUseCase(repository: characterRepository)
        }.inObjectScope(.container)

        // ViewModel
        container.register(HomeViewModel.self) { resolver in
            HomeViewModel(getCharactersUseCase: resolver.resolve(GetCharacterUseCaseProtocol.self)!)
        }
    }

    func resolve<T>(_ type: T.Type) -> T {
        container.resolve(T.self)!
    }
}
