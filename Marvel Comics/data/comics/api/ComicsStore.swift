//
//  ComicsStore.swift
//  Marvel Comics
//
//  Created by Marlow Charite on 11/9/22.
//

import Foundation

public protocol ComicsStore {
    
    /// Fetches a list of comics.
    ///
    /// - Returns: A list of available ``Comic``s
    func readComics() async throws -> [Comic]
    
    /// Fetches a single comic by id.
    ///
    /// - Parameter id: The identifier of the comic to fetch.
    /// - Returns: A unique ``Comic``
    func readComic(for id: Int) async throws -> Comic
}
