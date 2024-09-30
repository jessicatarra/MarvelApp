//
//  MarvelRoute.swift
//  Data
//
//  Created by Jessica Tarra on 28/09/24.
//
import CryptoKit
import Foundation
import Moya

public enum MarvelRoute {
    case getCharacters(offset: Int)
}

extension MarvelRoute: TargetType {
    public var task: Task {
        switch self {
        case .getCharacters(let offset):
            return .requestParameters(parameters: authParameters(offset: offset), encoding: URLEncoding.default)
        }
    }

    public var baseURL: URL {
        guard let url = URL(string: APIConstants.baseURL) else { fatalError() }
        return url
    }

    public var path: String {
        switch self {
        case .getCharacters(offset: _):
            return APIConstants.characters
        }
    }

    public var method: Moya.Method {
        return .get
    }

    public var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }

    public var sampleData: Data {
        return Data()
    }

    private func authParameters(offset: Int) -> [String: Any] {
        let timeStamp = "\(Date().timeIntervalSince1970)"
        let hash = (timeStamp + APIConstants.privateKey + APIConstants.publicKey).md5
        return ["offset": offset, "ts": timeStamp, "apikey": APIConstants.publicKey, "hash": hash]
    }
}

private extension String {
    var md5: String {
        let data = Data(utf8)
        let hash = Insecure.MD5.hash(data: data)
        return hash.map { String(format: "%02hhx", $0) }.joined()
    }
}
