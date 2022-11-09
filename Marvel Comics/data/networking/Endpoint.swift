//
//  Endpoint.swift
//  Marvel Comics
//
//  Created by Marlow Charite on 11/9/22.
//

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
    
    func request(with apiKey: ApiKey, baseUrl: URL) -> URLRequest? {
        guard let url = URL(string: path, relativeTo: baseUrl) else { return nil }
        
        let queryItems = [URLQueryItem(name: "apikey", value: apiKey)]
        
        var urlRequest = URLRequest(url: url.appending(queryItems: queryItems))
        urlRequest.httpMethod = method.rawValue
        urlRequest.httpBody = requestBody
        
        return urlRequest
    }
}
