//
//  RMLocationDetailViewViewModel.swift
//  RickAndMorty
//
//  Created by Szekely Janos on 19/02/2024.
//

import Foundation

protocol RMLocationDetailViewModelDelegate: AnyObject {
    func didFetchLocationDetails()
}

final class RMLocationDetailViewModel {
    private let endpointUrl: URL?
    private var dataTuple: (location: RMLocation, characters: [RMCharacter])? {
        didSet {
            createCellViewModels()
            delegate?.didFetchLocationDetails()
        }
    }
    
    enum SectionType {
        case information(viewmodels: [RMEpisodeInfoCollectionViewCellViewModel])
        case characters(viewmodels: [RMCharacterCollectionViewCellViewModel])
    }
    
    public weak var delegate: RMLocationDetailViewModelDelegate?
    
    public private(set) var cellViewModels: [SectionType] = []
    
    init(endpointUrl: URL?) {
        self.endpointUrl = endpointUrl
    }
    
    public func character(at index: Int) -> RMCharacter? {
        guard let dataTuple else { return nil }
        return dataTuple.characters[index]
    }
    
    /// Fetch backing location model
    public func fetchLocationData() {
        guard let url = endpointUrl,
              let request = RMRequest(url: url) else { return }
        
        RMService.shared.execute(request, expecting: RMLocation.self) { [weak self] result in
            switch result {
            case .success(let model):
                self?.fetchRelatedCharacters(location: model)
            case .failure:
                break
            }
        }
    }
    
    private func createCellViewModels() {
        guard let dataTuple else { return }
        let location = dataTuple.location
        let characters = dataTuple.characters
        var createdString = location.created
        if let date = RMCharacterInfoCollectionViewCellViewModel.dateFormatter.date(from: location.created) {
            createdString = RMCharacterInfoCollectionViewCellViewModel.shortDateFormatter.string(from: date)
        }
        cellViewModels = [
            .information(viewmodels: [
                .init(title: "location Name", value: location.name),
                .init(title: "Type", value: location.type),
                .init(title: "Dimension", value: location.dimension),
                .init(title: "Created", value: createdString)
            ]),
            .characters(viewmodels: characters.compactMap({
                return RMCharacterCollectionViewCellViewModel(characterName: $0.name,
                                                              characterStatus: $0.status,
                                                              characterImageUrl: URL(string: $0.image))
            }))
        ]
    }
    
    private func fetchRelatedCharacters(location: RMLocation) {
        let requests = location.residents.compactMap({
            return URL(string: $0)
        }).compactMap({
            return RMRequest(url: $0)
        })
        
        let group = DispatchGroup()
        var characters: [RMCharacter] = []
        for request in requests {
            group.enter()
            RMService.shared.execute(request,
                                     expecting: RMCharacter.self) { result in
                defer {
                    group.leave()
                }
                
                switch result {
                case .success(let model):
                    characters.append(model)
                case .failure:
                    break
                }
                
            }
        }
        group.notify(queue: .main) {
            self.dataTuple = (
                location: location,
                characters: characters
            )
        }
    }
}
