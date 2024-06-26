//
//  RMLocationTableViewCell.swift
//  RickAndMorty
//
//  Created by Szekely Janos on 17/02/2024.
//

import UIKit

class RMLocationTableViewCell: UITableViewCell {
    
    static let identifier = "RMLocationTableViewCell"
    
    private let nameLabel: UILabel = {
        let label = RMLabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .scaledMediumSystemFont(ofSize: 20)
        return label
    }()
    
    private let typeLabel: UILabel = {
        let label = RMLabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .scaledSystemFont(ofSize: 15)
        label.textColor = .secondaryLabel
        return label
    }()
    
    private let dimensionLabel: UILabel = {
        let label = RMLabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .scaledLightSystemFont(ofSize: 15)
        label.textColor = .secondaryLabel
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubviews(nameLabel, typeLabel, dimensionLabel)
        addConstraints()
        self.accessoryType = .disclosureIndicator
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        nameLabel.text = nil
        typeLabel.text = nil
        dimensionLabel.text = nil
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            nameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            nameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            
            typeLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            typeLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            typeLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            
            dimensionLabel.topAnchor.constraint(equalTo: typeLabel.bottomAnchor, constant: 10),
            dimensionLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            dimensionLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            dimensionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
    
    public func configure(with viewModel: RMLocationTableViewCellViewModel) {
        nameLabel.text = viewModel.name
        typeLabel.text = viewModel.type
        dimensionLabel.text = viewModel.dimension
    }
}
