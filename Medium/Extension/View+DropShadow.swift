//
//  View+DropShadow.swift
//  Medium
//
//  Created by Bilal Bakhrom on 05/05/2022.
//

import UIKit.UIView

extension UIView {
    func dropShadow(
        x: CGFloat = 0,
        y: CGFloat = 0,
        blur: CGFloat,
        color: UIColor = .black,
        alpha: Float = 0.33,
        spread: CGFloat = 0,
        cornerRadius: CGFloat = 0
    ) {
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = alpha
        layer.shadowOffset = CGSize(width: x, height: y)
        layer.shadowRadius = blur / 2
        layer.masksToBounds = false
        
        let rect = bounds.insetBy(dx: -spread, dy: -spread)
        layer.shadowPath = UIBezierPath(roundedRect: rect, cornerRadius: cornerRadius).cgPath
    }
}
