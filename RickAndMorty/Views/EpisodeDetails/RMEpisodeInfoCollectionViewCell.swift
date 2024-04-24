//
//  RMEpisodeInfoCollectionViewCell.swift
//  RickAndMorty
//
//  Created by Szekely Janos on 15/02/2024.
//

import UIKit

final class RMEpisodeInfoCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "RMEpisodeInfoCollectionViewCell"
    
    private let titleLabel: UILabel = {
        let label = RMLabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .scaledMediumSystemFont(ofSize: 20)
        return label
    }()
    
    private let valueLabel: UILabel = {
        let label = RMLabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .right
        label.numberOfLines = 0
        label.font = .scaledSystemFont(ofSize: 20)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .systemBackground
        contentView.addSubviews(titleLabel, valueLabel)
        setUpLayer()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setUpLayer() {
        layer.cornerRadius = 8
        layer.masksToBounds = true
        layer.borderWidth = 1
        layer.borderColor = UIColor.secondaryLabel.cgColor
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
        valueLabel.text = nil
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
            titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant:  -4),
            titleLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.45),
            
            valueLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
            valueLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            valueLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant:  -4),
            valueLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.45)
            
        ])
    }
    
    func configure(with viewModel: RMEpisodeInfoCollectionViewCellViewModel) {
        titleLabel.text = viewModel.title
        valueLabel.text = viewModel.value
    }
    
}
