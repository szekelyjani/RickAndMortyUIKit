//
//  RMSearchResultsViewModel.swift
//  RickAndMorty
//
//  Created by Szekely Janos on 24/02/2024.
//

import Foundation

enum RMSearchResultsViewModel {
    case characters([RMCharacterCollectionViewCellViewModel])
    case episodes([RMCharacterEpisodeCollectionViewCellViewModel])
    case locations([RMLocationTableViewCellViewModel])
}
