//
//  Endpoint+Comic.swift
//  Marvel Comics
//
//  Created by Marlow Charite on 11/9/22.
//

import Foundation

extension Endpoint where Response == [Comic] {
    
    static func comics() -> Self {
        Endpoint(path: "/comics")
    }
}

extension Endpoint where Response == Comic {
    
    static func comic(for id: Int) -> Self {
        Endpoint(path: "/comics/\(id)")
    }
}
