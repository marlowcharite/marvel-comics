//
//  LibraryView.swift
//  Marvel Comics
//
//  Created by Marlow Charite on 11/9/22.
//

import SwiftUI

struct LibraryView: View {
    
    @ObservedObject var viewModel: LibraryViewModel
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .navigationTitle("Marvel Comics")
    }
}

struct LibraryView_Previews: PreviewProvider {
    
    final class MockComicsRepository: ComicsRepository {
        func retrieveAllComics() async throws -> [ComicEntity] { [] }
        
        func retrieveComic(with id: Int) async throws -> ComicEntity {
            ComicEntity(id: 12, title: "Test", date: Date(), thumbnailPath: "", description: "")
        }
    }
    
    static var previews: some View {
        LibraryView(viewModel: LibraryViewModel(repository: MockComicsRepository()))
    }
}
