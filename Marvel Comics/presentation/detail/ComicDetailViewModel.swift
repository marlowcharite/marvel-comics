//
//  ComicDetailViewModel.swift
//  Marvel Comics
//
//  Created by Marlow Charite on 11/9/22.
//

import Combine
import Foundation

final class ComicDetailViewModel: ObservableObject, Identifiable {
    
    // MARK: - Outputs
    
    var id: Int { comic.id }
    
    var title: String { comic.title }
    
    var thumbnailCoverUrl: URL? { URL(string: "\(comic.coverImagePath)/portrait_medium.\(comic.coverImageExtension)") }
    
    var coverUrl: URL? { URL(string: "\(comic.coverImagePath)/portrait_fantastic.\(comic.coverImageExtension)") }
    
    var modifiedDate: Date { comic.date }
    
    // MARK: - Properties
    
    private let comic: ComicEntity
    
    // MARK: - Initializer
    
    init(comic: ComicEntity) {
        self.comic = comic
    }
}
