//
//  BaseViewController.swift
//  Medium
//
//  Created by Bilal Bakhrom on 04/05/2022.
//

import UIKit

class BaseViewController: UIViewController {
    let isReduceTransparencyEnabled = UIAccessibility.isReduceTransparencyEnabled
    
    var isNavBarHidden: Bool {
        return navigationController?.navigationBar.isHidden ?? true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        overrideUserInterfaceStyle = GeneralPreferences.shared.userInterfaceStyle
        view.backgroundColor = .primaryBackground
    }
    
    func setBackButton(for navigationItem: UINavigationItem) {
        navigationItem.leftBarButtonItem = makeBackButtonItem()
    }
    
    private func makeBackButtonItem() -> UIBarButtonItem {
        let frame = CGRect(origin: .zero, size: .init(width: 36, height: 36))
        let view = UIView(frame: frame)
        view.backgroundColor = .primaryBackground
        view.layer.cornerRadius = 8
        
        let gradientLayer = gradientBackground()
        gradientLayer.frame = frame
        view.layer.addSublayer(gradientLayer)
        
        let button = UIButton(frame: frame)
        button.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        button.addTarget(self, action: #selector(handleBackButtonClick), for: .touchUpInside)
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
        navigationController?.popViewController(animated: true)
    }
}
