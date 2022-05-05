//
//  BaseNavigationController.swift
//  Medium
//
//  Created by Bilal Bakhrom on 04/05/2022.
//

import UIKit

final class BaseNavigationController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        overrideUserInterfaceStyle = GeneralPreferences.shared.userInterfaceStyle
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setNeedsStatusBarAppearanceUpdate()
    }
    
    func setupStyledBackButtonItem(for navigationItem: UINavigationItem) {
        navigationItem.leftBarButtonItem = makeBackButtonItem(image: "chevron.backward",
                                                              target: self,
                                                              selector: #selector(handleBackButtonClick))
    }
    
    func addRightBarButtonItem(for navigationItem: UINavigationItem, imageName: String, target: Any?, selector: Selector) {
        navigationItem.rightBarButtonItem = makeBackButtonItem(image: imageName,
                                                              target: target,
                                                              selector: selector)
    }
    
    private func makeBackButtonItem(image: String, target: Any?, selector: Selector) -> UIBarButtonItem {
        let frame = CGRect(origin: .zero, size: .init(width: 36, height: 36))
        let view = UIView(frame: frame)
        view.backgroundColor = .primaryBackground
        view.layer.cornerRadius = 8
        
        let gradientLayer = gradientBackground()
        gradientLayer.frame = frame
        view.layer.addSublayer(gradientLayer)
        
        let button = UIButton(frame: frame)
        button.setImage(UIImage(systemName: image), for: .normal)
        button.addTarget(target, action: selector, for: .touchUpInside)
        view.addSubview(button)
        
        return UIBarButtonItem(customView: view)
    }
    
    private func gradientBackground() -> CAGradientLayer {
        let layer = CAGradientLayer()
        layer.colors = [
            UIColor(red: 34/255, green: 44/255, blue: 53/255, alpha: 0.0).cgColor,
            UIColor(red: 34/255, green: 44/255, blue: 53/255, alpha: 1.0).cgColor
        ]
        layer.startPoint = CGPoint(x: 0.5, y: 0)
        layer.endPoint = CGPoint(x: 0.5, y: 1.0)
        layer.cornerRadius = 8
        
        return layer
    }
    
    @objc private func handleBackButtonClick() {
        popViewController(animated: true)
    }
}
