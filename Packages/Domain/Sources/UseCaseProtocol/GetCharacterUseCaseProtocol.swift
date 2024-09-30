//
//  GetCharacterUseCaseProtocol.swift
//  Domain
//
//  Created by Jessica Tarra on 28/09/24.
//

import Entities
import Failures

public struct GetCharactersParams {
    public let offset: Int

    public init(offset: Int) {
        self.offset = offset
    }
}

public protocol GetCharacterUseCaseProtocol {
    func execute(with params: GetCharactersParams) async -> Result<[Character], AppFailure>
}
