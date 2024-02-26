//
//  RMLocationViewViewModel.swift
//  RickAndMorty
//
//  Created by Szekely Janos on 17/02/2024.
//

import Foundation

protocol RMLocationViewViewModelDelegate: AnyObject {
    func didFetchInitialLocations()
}

final class RMLocationViewViewModel {
    
    weak var delegate: RMLocationViewViewModelDelegate?
    
    private var locations: [RMLocation] = [] {
        didSet {
            for location in locations {
                let cellViewModel = RMLocationTableViewCellViewModel(location: location)
                if !cellViewModels.contains(cellViewModel) {
                    cellViewModels.append(cellViewModel)
                }
                
            }
        }
    }
    
    private var apiInfo: RMGetAllLocationsResponse.Info?
    
    public private(set) var cellViewModels: [RMLocationTableViewCellViewModel] = []
    
    public var shouldShowLoadMoraIndicator: Bool {
        return apiInfo?.next != nil
    }
    
    public var isLoadingMoreLocations = false
    private var didFinishPagination: (() -> Void)?
    
    /// Paginate if additional locations are needed
    public func fetchAdditionalLocations() {
        guard !isLoadingMoreLocations else { return }
        
        guard let nextUrlString = apiInfo?.next,
              let url = URL(string: nextUrlString) else {
            return
        }
        isLoadingMoreLocations = true
        
        guard let request = RMRequest(url: url) else {
            isLoadingMoreLocations = false
            return
        }
        
        RMService.shared.execute(request,
                                 expecting: RMGetAllLocationsResponse.self) { [weak self] result in
            guard let self else {
                return
            }
            switch result {
            case .success(let responseModel):
                let moreResults = responseModel.results
                let info = responseModel.info
                self.apiInfo = info
                self.cellViewModels.append(contentsOf: moreResults.compactMap({
                    return RMLocationTableViewCellViewModel(location: $0)
                }))
                DispatchQueue.main.async {
                    self.isLoadingMoreLocations = false
                    self.didFinishPagination?()
                }
            case .failure(let failure):
                print(String(describing: failure))
                self.isLoadingMoreLocations = false
            }
        }
    }
    
    public func registerDidFinishPaginationBlock(_ block: @escaping () -> Void) {
        self.didFinishPagination = block
    }
    
    init() { }
    
    public func location(at index: Int) -> RMLocation? {
        guard index < locations.count, index >= 0 else { return nil }
        return self.locations[index]
    }
    
    public func fetchLocations() {
        RMService.shared.execute(
            .listLocationsRequest,
            expecting: RMGetAllLocationsResponse.self
        ) { [weak self] result in
            switch result {
            case .success(let model):
                self?.apiInfo = model.info
                self?.locations = model.results
                DispatchQueue.main.async {
                    self?.delegate?.didFetchInitialLocations()
                }
            case .failure:
                break
            }
        }
    }
    
    private var hasMoreResults: Bool {
        return false
    }
}
