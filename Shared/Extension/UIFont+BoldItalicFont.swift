//
//  UIFont+BoldItalicFont.swift
//  RussiaLosses
//
//  Created by Anatoliy Khramchenko on 27.08.2023.
//

import UIKit

extension UIFont {
    static func boldItalicSystemFont(ofSize size: CGFloat) -> UIFont {
        let descriptor = UIFontDescriptor.preferredFontDescriptor(withTextStyle: .body).withSymbolicTraits([.traitBold, .traitItalic])!
        return UIFont(descriptor: descriptor, size: size)
    }
}
