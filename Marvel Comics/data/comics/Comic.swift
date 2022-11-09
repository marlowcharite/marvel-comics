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
    let textObjects: [TextObjects]?
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

public struct TextObjects: Decodable {
    let type: String?
    let language: String?
    let text: String?
}

public struct ComicURL: Decodable {
    let type:  String?
    let url:  String?
}

public struct SeriesSummary: Decodable {
    let resourceURI: String?
    let name: String?
}

public struct ComicSummary: Decodable {
    let resourceURI: String?
    let name: String?
}

public struct ComicDate: Decodable {
    let type: String?
    let date: Date?
}

public struct ComicPrice: Decodable {
    let type: String?
    let price: Float?
}

public struct ComicImage: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case path
        case _extension = "extension"
    }
    
    let path: String?
    let _extension: String?
}

public struct CreatorList: Decodable {
    let available: Int?
    let returned: Int?
    let collectionURI: String?
    let items: [CreatorSummary]?
}

public struct CreatorSummary: Decodable {
    let resourceURI: String?
    let name: String?
    let role: String?
}

public struct CharacterList: Decodable {
    let available:  Int?
    let returned:  Int?
    let collectionURI: String?
    let items: [CharacterSummary]?
}

public struct CharacterSummary: Decodable {
    let resourceURI: String?
    let name: String?
    let role: String?
}

public struct StoryList: Decodable {
    let available: Int?
    let returned: Int?
    let collectionURI: String?
    let items: [StorySummary]?
}

public struct StorySummary: Decodable {
    let resourceURI: String?
    let name: String?
    let type: String?
}

public struct EventList: Decodable {
    let available: Int?
    let returned: Int?
    let collectionURI: String?
    let items: [EventSummary]?
}

public struct EventSummary: Decodable {
    let resourceURI: String?
    let name: String?
}
