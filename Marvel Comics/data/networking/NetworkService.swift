//
//  NetworkService.swift
//  Marvel Comics
//
//  Created by Marlow Charite on 11/9/22.
//

import Foundation

protocol NetworkService {
    
    /// Performs a request to a given ``Endpoint``.
    /// 
    /// - Parameters:
    ///   - endpoint: The resource to send request to.
    ///   - decoder: The decoder used for data conversion.
    /// - Returns: A decoded response iff request is successful.
    func read<T: Decodable>(_ endpoint: Endpoint<T>, decoder: JSONDecoder) async throws -> T
}
