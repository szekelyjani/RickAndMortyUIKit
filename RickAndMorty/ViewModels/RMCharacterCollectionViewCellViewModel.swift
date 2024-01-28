//
//  RMCharacterCollectionViewCellViewModel.swift
//  RickAndMorty
//
//  Created by Szekely Janos on 08/12/2023.
//

import Foundation

final class RMCharacterCollectionViewCellViewModel: Hashable, Equatable {
    
    public var characterName: String
    private var characterStatus: RMCharacterStatus
    private var characterImageUrl: URL?
    
    init(
        characterName: String,
        characterStatus: RMCharacterStatus,
        characterImageUrl: URL?
    ) {
        self.characterName = characterName
        self.characterStatus = characterStatus
        self.characterImageUrl = characterImageUrl
    }
    
    public var characterStatusText: String {
        return "Status: \(characterStatus.text)"
    }
    
    public func fetchImage(completion: @escaping (Result<Data, Error>) -> Void) {
        // TODO: Abstract to Image Manager
        guard let url = characterImageUrl else {
            completion(.failure(URLError(.badURL)))
            return
        }
        RMImageManager.shared.downloadImage(url, completion: completion)
    }
    
    static func == (lhs: RMCharacterCollectionViewCellViewModel, rhs: RMCharacterCollectionViewCellViewModel) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(characterName)
        hasher.combine(characterStatus)
        hasher.combine(characterImageUrl)
    }
    
}
