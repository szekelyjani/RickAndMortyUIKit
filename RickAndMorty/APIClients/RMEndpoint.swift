//
//  RMEndpoint.swift
//  RickAndMorty
//
//  Created by Szekely Janos on 03/12/2023.
//

import Foundation

/// Represents uniq API endpoint
@frozen enum RMEndpoint: String, CaseIterable, Hashable {
    /// Endpoint ot get character info
    case character
    /// Endpoint ot get location info
    case location
    /// Endpoint ot get episode info
    case episode
}
