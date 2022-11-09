//
//  ComicResponse.swift
//  Marvel Comics
//
//  Created by Marlow Charite on 11/9/22.
//

import Foundation

public struct ComicResponse: Decodable {
    let code: Int?
    let status: String?
    let copyright: String?
    let attributionText: String?
    let attributionHTML: String?
    let data: ComicContainer?
    let etag: String?
}

public struct ComicContainer: Decodable {
    let offset: Int?
    let limit: Int?
    let total: Int?
    let count: Int?
    let results: [Comic]?
}
