//
//  Secrets.swift
//  Marvel Comics
//
//  Created by Marlow Charite on 11/9/22.
//

import Foundation

final class Secrets {
    
    // MARK: - Properties
    
    var baseURL: URL? {
        guard let path = bundle.object(forInfoDictionaryKey: Key.baseUrl.rawValue) as? String else { return nil }
        return URL(string: "https://" + path)
    }
    
    var apiKey: String? {
        guard let token = bundle.object(forInfoDictionaryKey: Key.publicKey.rawValue) as? String else { return nil }
        return token
    }
    
    var privateKey: String? {
        guard let token =  bundle.object(forInfoDictionaryKey: Key.privateKey.rawValue) as? String else { return nil }
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
        case baseUrl = "BASE_URL"
        case publicKey = "API_KEY"
        case privateKey = "PRIVATE_API_KEY"
    }
}
