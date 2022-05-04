//
//  Font+LatoFont.swift
//  Medium
//
//  Created by Bilal Bakhrom on 04/05/2022.
//

import UIKit

extension UIFont {
    enum LatoFontWeight: String {
        case black = "Lato-Black"
        case bold = "Lato-Bold"
        case italic = "Lato-Italic"
        case light = "Lato-Light"
        case regular = "Lato-Regular"
        case thin = "Lato-Thin"
        case hairline = "Lato-Hairline"
        case heavy = "Lato-Heavy"
        case medium = "Lato-Medium"
        case semibold = "Lato-Semibold"
    }
    
    static func lato(size: CGFloat, weight: LatoFontWeight) -> UIFont {
        UIFont(name: weight.rawValue, size: size)!
    }
}
