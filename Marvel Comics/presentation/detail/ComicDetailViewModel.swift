//
//  ComicDetailViewModel.swift
//  Marvel Comics
//
//  Created by Marlow Charite on 11/9/22.
//

import Combine
import Foundation

protocol ComicDetailRouter: AnyObject {
    
    /// Notifies the subscriber that the workflow is complete.
    func finished()
}

final class ComicDetailViewModel: ObservableObject, Identifiable {
    
    // MARK: - Outputs
    
    var id: Int { comic.id }
    
    var title: String { comic.title }
    
    var description: String { comic.description }
    
    var thumbnailCoverUrl: URL? { URL(string: "\(comic.coverImagePath)/portrait_medium.\(comic.coverImageExtension)") }
    
    var coverUrl: URL? { URL(string: "\(comic.coverImagePath)/portrait_incredible.\(comic.coverImageExtension)") }
    
    var modifiedDate: Date { comic.date }
    
    // MARK: - Properties
    
    private let comic: ComicEntity
    private weak var router: ComicDetailRouter?
    
    // MARK: - Initializer
    
    init(comic: ComicEntity, router: ComicDetailRouter? = nil) {
        self.comic = comic
        self.router = router
    }
    
    // MARK: - Inputs
    
    @MainActor
    func dismiss() {
        router?.finished()
    }
}
