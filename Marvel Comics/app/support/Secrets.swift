//
//  Secrets.swift
//  Marvel Comics
//
//  Created by Marlow Charite on 11/9/22.
//

import Foundation

final class Secrets {
    
    // MARK: - Properties
    
    var baseURL: URL? { URL(string: "https://gateway.marvel.com/") }
    
    var apiKey: String? {
        guard let token = bundle.infoDictionary?[Key.publicKey.rawValue] as? String else { return nil }
        return token
    }
    
    private let bundle: Bundle
    
    // MARK: - Initializers
    
    /// Creaates new app secrets for a given bundle.
    ///
    /// - Parameter bundle: The bundle to read secrets from.
    init(with bundle: Bundle = .main) {
        self.bundle = bundle
    }
    
    // MARK: - Supporting types
    
    private enum Key: String {
        case publicKey = "API_KEY"
    }
}
