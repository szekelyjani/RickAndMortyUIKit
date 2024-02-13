//
//  RMEpisodeDetailViewController.swift
//  RickAndMorty
//
//  Created by Szekely Janos on 13/02/2024.
//

import UIKit

/// VC to show dtetails about single episode
final class RMEpisodeDetailViewController: UIViewController {
    
    private let url: URL?

    init(url: URL?) {
        self.url = url
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Episode"
        view.backgroundColor = .systemGreen
    }

}
