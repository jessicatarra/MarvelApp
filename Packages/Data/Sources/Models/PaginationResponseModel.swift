//
//  PaginationResponseModel.swift
//  Data
//
//  Created by Jessica Tarra on 29/09/24.
//

public struct PaginationResponseModel<T>: Codable where T: Codable {
    public let offset, limit, total, count: Int?
    public let results: [T]?
}
