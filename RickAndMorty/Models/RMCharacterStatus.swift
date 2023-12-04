//
//  RMCharacterStatus.swift
//  RickAndMorty
//
//  Created by Szekely Janos on 03/12/2023.
//

import Foundation

enum RMCharacterStatus: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case `unknown` = "unknown"
}
