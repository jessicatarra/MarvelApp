//
//  APIConstants.swift
//  Data
//
//  Created by Jessica Tarra on 29/09/24.
//

import Foundation

public enum APIConstants {
    static let baseURL = "https://gateway.marvel.com/v1/public/"
    static let characters = "characters"
    public static let defaultLimit = 20
    static let publicKey: String = {
        guard let key = ProcessInfo.processInfo.environment["PUBLIC_KEY"] else {
            fatalError("PUBLIC_KEY not set in environment variables")
        }
        return key
    }()

    static let privateKey: String = {
        guard let key = ProcessInfo.processInfo.environment["PRIVATE_KEY"] else {
            fatalError("PRIVATE_KEY not set in environment variables")
        }
        return key
    }()
}
