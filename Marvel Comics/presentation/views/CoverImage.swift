//
//  CoverImage.swift
//  Marvel Comics
//
//  Created by Marlow Charite on 11/9/22.
//

import SwiftUI

struct CoverImage: View {
    let coverUrl: URL?
    
    var body: some View {
        AsyncImage(url: coverUrl) { image in
            image
                .resizable()
                .cornerRadius(3)
                .aspectRatio(contentMode: .fit)
        } placeholder: {
            ProgressView()
        }
    }
}
