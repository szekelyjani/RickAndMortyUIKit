//
//  RMSearchOptionPickerViewController.swift
//  RickAndMorty
//
//  Created by Szekely Janos on 22/02/2024.
//

import UIKit

final class RMSearchOptionPickerViewController: UIViewController {
    private let option: RMSearchInputViewViewModel.DynamicOption
    private let selectionBlock: ((String) -> Void)
    
    private let tablewView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        
        return tableView
    }()
    
    init(option: RMSearchInputViewViewModel.DynamicOption, selectionBlock: @escaping (String) -> Void) {
        self.option = option
        self.selectionBlock = selectionBlock
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupTableView()
    }

    private func setupTableView() {
        view.addSubview(tablewView)
        tablewView.delegate = self
        tablewView.dataSource = self
        
        NSLayoutConstraint.activate([
            tablewView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tablewView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            tablewView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            tablewView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension RMSearchOptionPickerViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return option.choices.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let choice = option.choices[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = choice.uppercased()
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let choice = option.choices[indexPath.row]
        tableView.deselectRow(at: indexPath, animated: true)
        self.selectionBlock(choice)
        dismiss(animated: true)
    }
    
}
