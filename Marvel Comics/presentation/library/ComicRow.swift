//
//  ComicRow.swift
//  Marvel Comics
//
//  Created by Marlow Charite on 11/9/22.
//

import SwiftUI

struct ComicRow: View {
    
    let viewModel: ComicDetailViewModel
    
    var body: some View {
        HStack {
            CoverImage(coverUrl: viewModel.thumbnailCoverUrl)
                .frame(width: 100, height: 100)
            VStack(alignment: .leading) {
                Text(viewModel.title)
                    .font(.subheadline)
                Text(viewModel.modifiedDate, style: .date)
                    .font(.caption)
            }
            Spacer()
        }
    }
}
