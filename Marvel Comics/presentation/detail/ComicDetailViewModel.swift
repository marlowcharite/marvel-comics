//
//  ComicDetailViewModel.swift
//  Marvel Comics
//
//  Created by Marlow Charite on 11/9/22.
//

import Combine

final class ComicDetailViewModel: ObservableObject, Identifiable {
    
    // MARK: - Outputs
    
    var id: Int { comic.id }
    
    var title: String { comic.title }
    
    // MARK: - Properties
    
    private let comic: ComicEntity
    
    // MARK: - Initializer
    
    init(comic: ComicEntity) {
        self.comic = comic
    }
}
