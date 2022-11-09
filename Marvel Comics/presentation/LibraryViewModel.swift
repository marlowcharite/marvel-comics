//
//  LibraryViewModel.swift
//  Marvel Comics
//
//  Created by Marlow Charite on 11/9/22.
//

import Combine

final class LibraryViewModel: ObservableObject {
    
    // MARK: - Outputs
    
    // MARK: - Properties
    
    private let repository: ComicsRepository
    
    // MARK: - Initializers
    
    init(repository: ComicsRepository) {
        self.repository = repository
    }
    
    // MARK: - Inputs
}
