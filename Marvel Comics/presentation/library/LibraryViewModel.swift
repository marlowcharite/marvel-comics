//
//  LibraryViewModel.swift
//  Marvel Comics
//
//  Created by Marlow Charite on 11/9/22.
//

import Combine

final class LibraryViewModel: ObservableObject {
    
    // MARK: - Outputs
    
    @Published private(set) var comics: [ComicEntity] = []
    @Published var errorMessage: String?
    
    // MARK: - Properties
    
    private let repository: ComicsRepository
    
    // MARK: - Initializers
    
    init(repository: ComicsRepository) {
        self.repository = repository
    }
    
    // MARK: - Inputs
    
    @MainActor
    func loadComics() async {
        do {
            comics = try await repository.retrieveAllComics()
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
