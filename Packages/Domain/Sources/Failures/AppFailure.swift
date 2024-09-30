//
//  AppFailures.swift
//  Domain
//
//  Created by Jessica Tarra on 28/09/24.
//

public enum AppFailure: Error, Equatable {
    case serverError(message: String)
    case networkError(message: String)
    case unknownError(message: String)
}
