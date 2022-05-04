//
//  Label.swift
//  Medium
//
//  Created by Bilal Bakhrom on 05/05/2022.
//

import UIKit

class Label: UILabel {    
    func setFont(_ latoFont: LatoFont) {
        font = latoFont.font
    }
    
    func setTextColor(_ color: UIColor) {
        textColor = color
    }
    
    func setTitle(_ title: String, kern: CGFloat) {
        let attributedText = NSMutableAttributedString(string: title)
        attributedText.addAttribute(.kern, value: 1.25, range: NSRange(location: 0, length: title.count))
        self.attributedText = attributedText
    }
}
