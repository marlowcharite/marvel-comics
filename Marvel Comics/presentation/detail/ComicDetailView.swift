//
//  ComicDetailView.swift
//  Marvel Comics
//
//  Created by Marlow Charite on 11/9/22.
//

import SwiftUI

struct ComicDetailView: View {
    
    @ObservedObject var viewModel: ComicDetailViewModel
    
    var body: some View {
        Text(viewModel.title)
    }
}

struct ComicDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ComicDetailView(viewModel: ComicDetailViewModel(comic: ComicEntity(
            id: 3,
            title: "The Amazing Spider-Man",
            date: Date(),
            coverImagePath: "",
            coverImageExtension: "",
            description: ""
        )))
    }
}
