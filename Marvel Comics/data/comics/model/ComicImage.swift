//
//  ComicImage.swift
//  Marvel Comics
//
//  Created by Marlow Charite on 11/9/22.
//

import Foundation

public struct ComicImage: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case path
        case _extension = "extension"
    }
    
    let path: String?
    let _extension: String?
}
