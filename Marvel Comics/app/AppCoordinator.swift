//
//  AppCoordinator.swift
//  Marvel Comics
//
//  Created by Marlow Charite on 11/9/22.
//

import Combine

/// The main navigation coordinator.
final class AppCoordinator: ObservableObject, LibraryViewModelObserver {
    
    // MARK: - Properties
    
    @Published var libraryViewModel: LibraryViewModel!
    @Published var detailViewModel: ComicDetailViewModel?
    
    // MARK: - Initializers
    
    init(_ repository: ComicsRepository) {
       libraryViewModel = LibraryViewModel(repository: repository, observer: self)
    }
    
    // MARK: - <LibraryViewModelObserver>
    
    func didSelectComic(_ comic: ComicEntity) {
        detailViewModel = ComicDetailViewModel(comic: comic)
    }
}
