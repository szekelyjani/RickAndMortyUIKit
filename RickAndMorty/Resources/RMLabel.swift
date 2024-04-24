//
//  RMLabel.swift
//  RickAndMorty
//
//  Created by János Székely on 23/04/2024.
//

import UIKit

class RMLabel: UILabel {
    private var _maximumPointSize: CGFloat = 20
    @IBInspectable
    var maximumPointSize: CGFloat {
        get { return _maximumPointSize }
        set(key) { _maximumPointSize = key }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    init(text: String) {
        super.init(frame: .zero)
        self.text = text
        adjustsFontForContentSizeCategory = true
    }
    
    init(attributedText: NSAttributedString, numberOfLines: Int? = 0) {
        super.init(frame: .zero)
        self.attributedText = attributedText
        self.numberOfLines = numberOfLines ?? 0
        adjustsFontForContentSizeCategory = true
    }
    
    func commonInit() {
        adjustsFontForContentSizeCategory = true
        font = font.scaledFont(_maximumPointSize)
    }
    
}

