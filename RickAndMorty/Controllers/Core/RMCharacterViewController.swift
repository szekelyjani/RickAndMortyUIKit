//
//  RMCharacterViewController.swift
//  RickAndMorty
//
//  Created by Szekely Janos on 02/12/2023.
//

import UIKit

/// Controller to show and search for Characters
final class RMCharacterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Characters"
        
        let request = RMRequest(endpoint: .character,
                                queryParamters: [
                                URLQueryItem(name: "name", value: "rick"),
                                URLQueryItem(name: "status", value: "alive")
        ])
        print(request.url)
    }


}
