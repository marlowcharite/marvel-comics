//
//  Endpoint+Comic.swift
//  Marvel Comics
//
//  Created by Marlow Charite on 11/9/22.
//

import Foundation

extension Endpoint where Response == ComicResponse {
    
    static func comics() -> Self {
        Endpoint(path: "/v1/public/comics")
    }
    
    static func comic(for id: Int) -> Self {
        Endpoint(path: "/v1/public/comics/\(id)")
    }
}
