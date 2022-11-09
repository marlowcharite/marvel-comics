//
//  AppCoordinator.swift
//  Marvel Comics
//
//  Created by Marlow Charite on 11/9/22.
//

import Combine

/// The main navigation coordinator.
final class AppCoordinator: ObservableObject {
    
    // MARK: - Properties
    
    @Published var libraryViewModel: LibraryViewModel!
    
    // MARK: - Initializers
    
    init(_ repository: ComicsRepository) {
       libraryViewModel = LibraryViewModel(repository: repository)
    }
}
