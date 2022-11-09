//
//  ComicsAPI.swift
//  Marvel Comics
//
//  Created by Marlow Charite on 11/9/22.
//

import Foundation

final class ComicsAPI: ComicsStore {
    
    enum ComicsError: Error {
        case invalidResponse
    }
    
    // MARK: - Properties
    
    private let service: NetworkService
    
    // MARK: - Initializer
    
    init(service: NetworkService) {
        self.service = service
    }
    
    func readComics() async throws -> [Comic] {
        let response = try await service.read(.comics())
        return response.data?.results ?? []
    }
    
    func readComic(for id: Int) async throws -> Comic {
        let response = try await service.read(.comic(for: id))
        
        guard let comic = response.data?.results?.first else {
            throw ComicsError.invalidResponse
        }
        
        return comic
    }
}
