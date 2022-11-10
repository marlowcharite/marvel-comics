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
        VStack {
            HStack {
                Button {
                    viewModel.dismiss()
                } label: {
                    Image(systemName: "xmark")
                        .font(.caption)
                }
                .foregroundColor(.gray)
                
                Spacer()
            }
            .padding(.bottom, 20)
            
            CoverImage(coverUrl: viewModel.coverUrl)
                .frame(height: 500)
            
            Text(viewModel.title)
                .font(.headline)
                .padding(.bottom, 10)

            VStack(alignment: .leading, spacing: 10) {
                Text("STORY:")
                    .foregroundColor(.gray)
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .frame(alignment: .leading)
                Text(viewModel.description)
                    .font(.caption)
            }
            
            Spacer()
        }
        .padding()
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
