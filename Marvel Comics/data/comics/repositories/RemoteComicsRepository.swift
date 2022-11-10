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
        let response = try await store.readComics()
        return response.compactMap(Self.convertDto(_:))
    }
    
    func retrieveComic(with id: Int) async throws -> ComicEntity {
        let response = try await store.readComic(for: id)
        guard let comic = Self.convertDto(response) else {
            throw ComicsAPI.ComicsError.invalidResponse
        }
        return comic
    }
    
    // MARK: - Support
    
    private static func convertDto(_ dto: Comic) -> ComicEntity? {
        guard let id = dto.id,
              let title = dto.title,
              let modified = dto.modified,
              let date = ISO8601DateFormatter().date(from: modified),
              let description = dto.description,
              let thumbnailPath = dto.thumbnail?.path,
              let ext = dto.thumbnail?._extension else { return nil }
        
        return ComicEntity(
            id: id,
            title: title,
            date: date,
            coverImagePath: thumbnailPath,
            coverImageExtension: ext,
            description: description
        )
    }
}
