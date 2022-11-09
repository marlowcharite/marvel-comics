//
//  RemoteComicsRepository.swift
//  Marvel Comics
//
//  Created by Marlow Charite on 11/9/22.
//

import Foundation

final class RemoteComicsRepository: ComicsRepository {
        
    // MARK: - Properties
    
    private let store: ComicsStore
    
    // MARK: - Initializers
    
    init(store: ComicsStore) {
        self.store = store
    }
    
    func retrieveAllComics() async throws -> [ComicEntity] {
        []
    }
    
    func retrieveComic(with id: Int) async throws -> ComicEntity {
        // TODO: - update
        ComicEntity(id: 12, title: "Test", date: Date(), thumbnailPath: "", description: "")
    }
}
