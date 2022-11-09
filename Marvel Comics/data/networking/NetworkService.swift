//
//  NetworkService.swift
//  Marvel Comics
//
//  Created by Marlow Charite on 11/9/22.
//

import Foundation

protocol NetworkService {
    
    /// The decoder used for data conversion.
    var decoder: JSONDecoder { get }
    
    /// Performs a request to a given ``Endpoint``.
    /// 
    /// - Parameters endpoint: The resource to send request to.
    /// - Returns: A decoded response iff request is successful.
    func read<T: Decodable>(_ endpoint: Endpoint<T>) async throws -> T
}
