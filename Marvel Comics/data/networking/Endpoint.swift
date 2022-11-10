//
//  Endpoint.swift
//  Marvel Comics
//
//  Created by Marlow Charite on 11/9/22.
//

import CryptoKit
import Foundation

typealias ApiKey = String

struct Endpoint<Response: Decodable> {
    enum HTTPMethod: String {
        case get = "GET"
    }
    
    var method: HTTPMethod = .get
    var path: String
    var requestBody: Data?
}

extension Endpoint {
    
    func request(with apiKey: ApiKey, privateKey: ApiKey, baseUrl: URL) -> URLRequest? {
        guard let url = URL(string: path, relativeTo: baseUrl) else { return nil }
        
        let timestamp = "\(Int((Date().timeIntervalSince1970 * 1000.0).rounded()))"
        let hash = "\(timestamp)\(privateKey)\(apiKey)".md5()
        
        let queryItems = [
            URLQueryItem(name: "apikey", value: apiKey),
            URLQueryItem(name: "ts", value: timestamp),
            URLQueryItem(name: "hash", value: hash)
        ]
        
        var urlRequest = URLRequest(url: url.appending(queryItems: queryItems))
        urlRequest.httpMethod = method.rawValue
        urlRequest.httpBody = requestBody
        
        return urlRequest
    }
}

// MARK: - Support

private extension String {

    func md5() -> String {
        guard let encodedData = data(using: .utf8) else { return "" }
        return Insecure.MD5
            .hash(data: encodedData)
            .map { String(format: "%02hhx", $0) }
            .joined()
    }
}
