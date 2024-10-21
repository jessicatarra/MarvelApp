//
//  ThumbnailModel.swift
//  Data
//
//  Created by Jessica Tarra on 28/09/24.
//

import Foundation

public struct ThumbnailModel {
    public let path: String?
    public let thumbnailExtension: String?

    public var url: URL? {
        guard let path, let ext = thumbnailExtension else { return nil }
        return URL(string: "\(path).\(ext)")
    }

    init(
        path: String? = nil,
        thumbnailExtension: String? = nil
    ) {
        self.path = path
        self.thumbnailExtension = thumbnailExtension
    }
}

extension ThumbnailModel: Codable {
    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
    }
}
