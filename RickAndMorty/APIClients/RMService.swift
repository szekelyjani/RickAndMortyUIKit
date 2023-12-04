//
//  RMService.swift
//  RickAndMorty
//
//  Created by Szekely Janos on 02/12/2023.
//

import Foundation

///  Primary API service object to get Rick and Morty data
final class RMService {
    /// Shared singleton instance
    static let shared = RMService()
    
    /// Privatized constructor
    private init() {}
    
    /// Send Rick and  Morty API call
    /// - Parameters:
    ///   - request: Request instance
    ///   - type: The type of object we except to get back
    ///   - completion: Callback with data or error
    public func execute<T: Codable>(_ request: RMRequest,
                                    expecting type: T.Type,
                                    completion: (Result<T, Error>) -> Void
    ) {
    }
}
