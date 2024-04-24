//
//  RMCharacterEpisodeCollectionViewCell.swift
//  RickAndMorty
//
//  Created by Szekely Janos on 07/02/2024.
//

import UIKit

final class RMCharacterEpisodeCollectionViewCell: UICollectionViewCell {
    static let identifier = "RMCharacterEpisodeCollectionViewCell"
    
    private let seasonLabel: UILabel = {
        let label = RMLabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .scaledSemiBoldSystemFont(ofSize: 20)
        return label
    }()
    
    private let nameLabel: UILabel = {
        let label = RMLabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .scaledSystemFont(ofSize: 22)
        return label
    }()
    
    private let airDateLabel: UILabel = {
        let label = RMLabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .scaledLightSystemFont(ofSize: 18)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .tertiarySystemBackground
        setupLayer()
        contentView.addSubviews(seasonLabel, nameLabel, airDateLabel)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setupLayer() {
        contentView.layer.cornerRadius = 8
        contentView.layer.borderWidth = 2
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            seasonLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            seasonLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            seasonLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            seasonLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.3),
            
            nameLabel.topAnchor.constraint(equalTo: seasonLabel.bottomAnchor),
            nameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            nameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            nameLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.3),
            
            airDateLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            airDateLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            airDateLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            airDateLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.3)
        ])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        seasonLabel.text = nil
        nameLabel.text = nil
        airDateLabel.text = nil
    }
    
    public func configure(with viewModel: RMCharacterEpisodeCollectionViewCellViewModel) {
        viewModel.registerForData { [weak self] data in
            self?.seasonLabel.text = "Episode "+data.episode
            self?.nameLabel.text = data.name
            self?.airDateLabel.text = "Aired on "+data.air_date
        }
        viewModel.fetchEpisode()
        contentView.layer.borderColor = viewModel.borderColor.cgColor
    }
    
}
