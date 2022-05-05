//
//  Button.swift
//  Medium
//
//  Created by Bilal Bakhrom on 05/05/2022.
//

import UIKit

class Button: UIButton {
    private lazy var gradientLayer: CAGradientLayer = {
        let layer = CAGradientLayer()
        layer.colors = [
            UIColor(red: 195/255, green: 0, blue: 46/255, alpha: 1.0).cgColor,
            UIColor(red: 240/255, green: 0, blue: 0, alpha: 1.0).cgColor
        ]
        layer.startPoint = .init(x: 0, y: 0)
        layer.endPoint = .init(x: 1, y: 1)
        layer.cornerRadius = 12
        
        return layer
    }()
    
    open override var intrinsicContentSize: CGSize {
        CGSize(width: UIScreen.main.bounds.width - 60, height: 48)
    }
    
    override var isEnabled: Bool {
        didSet {
            gradientLayer.opacity = isEnabled ? 1.0 : 0.3
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .accent
        layer.cornerRadius = 12
        layer.addSublayer(gradientLayer)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        gradientLayer.frame = bounds
    }
    
    override func setTitle(_ title: String?, for state: UIControl.State) {
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.lato(size: 15, weight: .semibold),
            .foregroundColor: UIColor.primaryLabel
        ]
        
        setAttributedTitle(NSAttributedString(string: title ?? "", attributes: attributes), for: state)
    }
}
