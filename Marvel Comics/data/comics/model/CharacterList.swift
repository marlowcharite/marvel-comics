//
//  CharacterList.swift
//  Marvel Comics
//
//  Created by Marlow Charite on 11/9/22.
//

import Foundation

public struct CharacterList: Decodable {
    let available:  Int?
    let returned:  Int?
    let collectionURI: String?
    let items: [CharacterSummary]?
}
