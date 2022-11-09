//
//  TextObject.swift
//  Marvel Comics
//
//  Created by Marlow Charite on 11/9/22.
//

import Foundation

public struct TextObject: Decodable {
    let type: String?
    let language: String?
    let text: String?
}
