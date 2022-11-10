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
        VStack {
            if let message = viewModel.errorMessage {
                Text("Error: \(message)")
            }
            
            if viewModel.isLoading {
                ProgressView()
            } else {
                ForEach(viewModel.comics, id: \.id) { comic in
                    Text(comic.title)
                }
            }
        }
        .navigationTitle("Marvel Comics")
        .task {
            await viewModel.loadComics()
        }
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
