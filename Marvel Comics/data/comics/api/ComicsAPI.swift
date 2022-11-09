//
//  ComicsAPI.swift
//  Marvel Comics
//
//  Created by Marlow Charite on 11/9/22.
//

import Foundation

final class ComicsAPI: ComicsStore {
    
    // MARK: - Properties
    
    private let service: NetworkService
    
    // MARK: - Initializer
    
    init(service: NetworkService) {
        self.service = service
    }
    
    func readComics() async throws -> [Comic] {
        try await service.read(.comics())
    }
    
    func readComic(for id: Int) async throws -> Comic {
        try await service.read(.comic(for: id))

    }
}
