//
//  BaseResponseModel.swift
//  Data
//
//  Created by Jessica Tarra on 20/10/24.
//

public struct BaseResponseModel<T: Codable>: Codable {
    public let code: Int
    public let status: String
    public let data: T
}
