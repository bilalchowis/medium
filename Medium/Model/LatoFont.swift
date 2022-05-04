//
//  LatoFont.swift
//  Medium
//
//  Created by Bilal Bakhrom on 04/05/2022.
//

import UIKit

enum LatoFont {
    /// x24, semibold
    case title
    /// x20, semibold
    case title3
    /// x18, semibold
    case headline
    /// x16, semibold
    case body1
    /// x16, regular
    case body2
    /// x14, regular
    case subhead1
    /// x14, semibold
    case subhead2
    /// x12, regular
    case caption1
    /// x12, semibold
    case caption2
    
    var font: UIFont {
        switch self {
        case .title: return .lato(size: 24, weight: .semibold)
        case .title3: return .lato(size: 20, weight: .semibold)
        case .headline: return .lato(size: 18, weight: .semibold)
        case .body1: return .lato(size: 16, weight: .semibold)
        case .body2: return .lato(size: 16, weight: .regular)
        case .subhead1: return .lato(size: 14, weight: .regular)
        case .subhead2: return .lato(size: 14, weight: .bold)
        case .caption1: return .lato(size: 12, weight: .regular)
        case .caption2: return .lato(size: 12, weight: .semibold)
        }
    }
}
