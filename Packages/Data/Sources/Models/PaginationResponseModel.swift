//
//  PaginationResponseModel.swift
//  Data
//
//  Created by Jessica Tarra on 29/09/24.
//

public struct PaginationResponseModel<T: Decodable>: Decodable {
    public let offset: Int
    public let limit: Int
    public let total: Int
    public let count: Int
    public let results: [T]
}
