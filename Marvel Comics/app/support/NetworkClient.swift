//
//  NetworkClient.swift
//  Marvel Comics
//
//  Created by Marlow Charite on 11/9/22.
//

import Foundation

final class NetworkClient: NetworkService {
    
    enum NetworkError: Error {
        case missingApiKey
        case missingBaseURL
        case requestFailed
    }
    
    // MARK: - Properties
    
    let decoder: JSONDecoder
    private let secrets: Secrets
    private let session: URLSession
    
    init(with secrets: Secrets,
         decoder: JSONDecoder = JSONDecoder(),
         session: URLSession = .shared) {
        decoder.dateDecodingStrategy = .iso8601
        self.decoder = decoder
        self.secrets = secrets
        self.session = session
    }
    
    func read<T: Decodable>(_ endpoint: Endpoint<T>) async throws -> T {
        guard let baseUrl = secrets.baseURL, let privateKey = secrets.privateKey, let apiKey = secrets.apiKey else {
            throw NetworkError.missingApiKey
        }
        
        guard let request = endpoint.request(with: apiKey, privateKey: privateKey, baseUrl: baseUrl) else {
            throw NetworkError.missingBaseURL
        }
        
        let (data, response) = try await session.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NetworkError.requestFailed
        }
        
        return try decoder.decode(T.self, from: data)
    }
}
