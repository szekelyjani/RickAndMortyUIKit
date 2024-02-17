//
//  RMGetAllEpisodesResponse.swift
//  RickAndMorty
//
//  Created by Szekely Janos on 13/02/2024.
//

import Foundation

struct RMGetAllEpisodesResponse: Codable {
    
    struct Info: Codable {
        let count: Int
        let pages: Int
        let next: String?
        let prev: String?
    }
    
    let info: Info
    let results: [RMEpisode]
    
}
