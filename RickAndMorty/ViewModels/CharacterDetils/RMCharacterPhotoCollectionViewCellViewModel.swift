//
//  RMCharacterPhotoCollectionViewCellViewModel.swift
//  RickAndMorty
//
//  Created by Szekely Janos on 07/02/2024.
//

import Foundation

final class RMCharacterPhotoCollectionViewCellViewModel {
    private let imageUrl: URL?
    
    init(imageUrl: URL?) {
        self.imageUrl = imageUrl
    }
    
    public func fetchImage(completion: @escaping (Result<Data, Error>) -> Void) {
        guard let imageUrl else {
            completion(.failure(URLError(.badURL)))
            return
        }
        RMImageManager.shared.downloadImage(imageUrl, completion: completion)
    }
}
