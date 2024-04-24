//
//  Extensions.swift
//  RickAndMorty
//
//  Created by Szekely Janos on 07/12/2023.
//

import UIKit

extension UIView {
    
    func addSubviews(_ views: UIView...) {
        views.forEach({
            addSubview($0)
        })
    }
}

extension UIDevice {
    static let isIphone = UIDevice.current.userInterfaceIdiom == .phone
}

extension UIFont {
    func scaledFont(_ maximumPointSize: CGFloat? = 22) -> UIFont {
        return UIFontMetrics.default.scaledFont(for: self, maximumPointSize: maximumPointSize ?? 22)
    }
    
    class func scaledSystemFont(ofSize size: CGFloat) -> UIFont {
        return UIFontMetrics.default.scaledFont(for: .systemFont(ofSize: size), maximumPointSize: 22)
    }
    
    class func scaledLightSystemFont(ofSize size: CGFloat) -> UIFont {
        return UIFontMetrics.default.scaledFont(for: .systemFont(ofSize: size, weight: .light), maximumPointSize: 22)
    }
    
    class func scaledMediumSystemFont(ofSize size: CGFloat) -> UIFont {
        return UIFontMetrics.default.scaledFont(for: .systemFont(ofSize: size, weight: .medium), maximumPointSize: 22)
    }
    
    class func scaledSemiBoldSystemFont(ofSize size: CGFloat) -> UIFont {
        return UIFontMetrics.default.scaledFont(for: .systemFont(ofSize: size, weight: .semibold), maximumPointSize: 22)
    }

    class func scaledBoldSystemFont(ofSize size: CGFloat) -> UIFont {
        return UIFontMetrics.default.scaledFont(for: .boldSystemFont(ofSize: size), maximumPointSize: 22)
    }
    
    

}
