//
//  ThumbnailModel.swift
//  Data
//
//  Created by Jessica Tarra on 28/09/24.
//

import Foundation

public struct ThumbnailModel: Decodable, Equatable {
    public let path: String? 
    public let thumbnailExtension: String? 
    public let url: URL? 
}
