//
//  RMEpisodeDetailViewController.swift
//  RickAndMorty
//
//  Created by Szekely Janos on 13/02/2024.
//

import UIKit

/// VC to show dtetails about single episode
final class RMEpisodeDetailViewController: UIViewController, RMEpisodeDetailViewModelDelegate, RMEpisodeDetailViewDelegate {
    
    private let viewModel: RMEpisodeDetailViewModel
    private let detailView = RMEpisodeDetailView()

    init(url: URL?) {
        self.viewModel = RMEpisodeDetailViewModel(endpointUrl: url)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(detailView)
        detailView.delegate = self
        addConstraints()
        
        title = "Episode"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action,
                                                            target: self,
                                                            action: #selector(didTapShare))
        viewModel.delegate = self
        viewModel.fetchEpisodeData()
    }

    private func addConstraints() {
        NSLayoutConstraint.activate([
            detailView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            detailView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            detailView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            detailView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    @objc
    private func didTapShare() {
        
    }
    
    func didFetchEpisodeDetails() {
        detailView.configure(with: viewModel)
    }
    
    func rmEpisodeDetailView(_ detailView: RMEpisodeDetailView, didSelect character: RMCharacter) {
        let vc = RMCharacterDetailViewController(viewModel: .init(character: character))
        vc.title = character.name
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)
    }
}
