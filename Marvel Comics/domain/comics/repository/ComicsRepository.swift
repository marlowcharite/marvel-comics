//
//  ComicsRepository.swift
//  Marvel Comics
//
//  Created by Marlow Charite on 11/9/22.
//

import Foundation

protocol ComicsRepository {
    
    /// Fetches a list of comics.
    ///
    /// - Returns: A list of available ``ComicEntity``s
    func retrieveAllComics() async throws -> [ComicEntity]
    
    /// Fetches a single comic by id.
    ///
    /// - Parameter id: The identifier of the comic to fetch.
    /// - Returns: A unique ``ComicEntity``
    func retrieveComic(with id: Int) async throws -> ComicEntity
}
