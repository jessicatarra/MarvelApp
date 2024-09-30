//
//  CharacterRepositoryProtocol.swift
//  Domain
//
//  Created by Jessica Tarra on 28/09/24.
//

import Entities
import Failures

public protocol CharacterRepositoryProtocol {
    func getCharacters(from offset: Int) async -> Result<[Character], AppFailure>
}