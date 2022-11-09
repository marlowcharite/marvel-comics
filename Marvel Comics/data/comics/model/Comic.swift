//
//  Comic.swift
//  Marvel Comics
//
//  Created by Marlow Charite on 11/9/22.
//

import Foundation

public struct Comic: Decodable {
    
    let id: Int?
    let digitalId: Int?
    let title: String?
    let issueNumber: Double?
    let variantDescription: String?
    let description: String?
    let modified: Date?
    let isbn: String?
    let upc: String?
    let diamondCode: String?
    let ean: String?
    let issn: String?
    let format: String?
    let pageCount: Int?
    let textObjects: [TextObject]?
    let resourceURI: String?
    let urls: [ComicURL]?
    let series: SeriesSummary?
    let variants: [ComicSummary]?
    let collections: [ComicSummary]?
    let collectedIssues: [ComicSummary]?
    let dates: [ComicDate]?
    let prices: [ComicPrice]?
    let thumbnail: ComicImage?
    let images: [ComicImage]?
    let creators: CreatorList?
    let characters: CharacterList?
    let stories: StoryList?
    let events: EventList?
}
