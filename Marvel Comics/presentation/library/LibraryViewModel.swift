//
//  LibraryViewModel.swift
//  Marvel Comics
//
//  Created by Marlow Charite on 11/9/22.
//

import Combine

protocol LibraryViewModelObserver: AnyObject {
    
    /// Notifies subscribers of a comic selection event.
    ///
    /// - Parameter comic: The comic that was selected.
    func didSelectComic(_ comic: ComicEntity)
}

final class LibraryViewModel: ObservableObject {
    
    // MARK: - Outputs
    
    @Published private(set) var comics: [ComicEntity] = []
    @Published var errorMessage: String?
    @Published private(set) var isLoading = false

    // MARK: - Properties
    
    private let repository: ComicsRepository
    private weak var selectionObserver: LibraryViewModelObserver?
    
    // MARK: - Initializers
    
    /// Creates a new ``LibraryViewModel``.
    ///
    /// - Parameters:
    ///   - repository: The comic datastore.
    ///   - observer: An observer to notify about comic selection.
    init(repository: ComicsRepository, observer: LibraryViewModelObserver? = nil) {
        self.repository = repository
        selectionObserver = observer
    }
    
    // MARK: - Inputs
    
    /// Fetches a list of comics.
    @MainActor
    func loadComics() async {
        defer { isLoading = false }
        isLoading = true
        
        do {
            comics = try await repository.retrieveAllComics()
        } catch {
            errorMessage = error.localizedDescription
        }
    }
    
    /// Handles the event of comic selection.
    ///
    /// - Parameter comic: The comic that was selected.
    func showDetail(for comic: ComicEntity) {
        selectionObserver?.didSelectComic(comic)
    }
}
