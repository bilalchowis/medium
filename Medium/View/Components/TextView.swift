//
//  TextView.swift
//  Medium
//
//  Created by Bilal Bakhrom on 05/05/2022.
//

import UIKit

class TextView: UITextView {
    func setFont(_ latoFont: LatoFont) {
        font = latoFont.font
    }
    
    func setTextColor(_ color: UIColor) {
        textColor = color
    }
}
