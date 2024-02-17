//
//  RMLocationTableViewCell.swift
//  RickAndMorty
//
//  Created by Szekely Janos on 17/02/2024.
//

import UIKit

class RMLocationTableViewCell: UITableViewCell {
    
    static let identifier = "RMLocationTableViewCell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemBackground
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    public func configure(with viewModel: RMLocationTableViewCellViewModel) {
        
    }
}
