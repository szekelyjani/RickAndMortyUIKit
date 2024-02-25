//
//  RMSearchResultsView.swift
//  RickAndMorty
//
//  Created by Szekely Janos on 25/02/2024.
//

import UIKit

/// Shows search results UI (table or collection as needed)
final class RMSearchResultsView: UIView {
    
    private var viewModel: RMSearchResultsViewModel? {
        didSet {
            self.processViewModel()
        }
    }
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(RMLocationTableViewCell.self,
                           forCellReuseIdentifier: RMLocationTableViewCell.identifier)
        tableView.isHidden = true
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        isHidden = true
        backgroundColor = .systemBackground
        addSubviews(tableView)
        translatesAutoresizingMaskIntoConstraints = false
        addConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func processViewModel() {
        guard let viewModel else { return }
        switch viewModel {
        case .characters(let viewModels):
            setUpCollectionView()
        case .episodes(let viewModels):
            setupTableView()
        case .locations(let viewModels):
            break
        }
    }
    
    private func addConstraint() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leftAnchor.constraint(equalTo: leftAnchor),
            tableView.rightAnchor.constraint(equalTo: rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        tableView.backgroundColor = .yellow
    }
    
    private func setUpCollectionView() {
        
    }
    
    private func setupTableView() {
        tableView.isHidden = false
    }
    
    public func configure(with viewModel: RMSearchResultsViewModel) {
        self.viewModel = viewModel
        
    }

}
