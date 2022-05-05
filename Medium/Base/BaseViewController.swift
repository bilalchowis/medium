//
//  BaseViewController.swift
//  Medium
//
//  Created by Bilal Bakhrom on 04/05/2022.
//

import UIKit

class BaseViewController: UIViewController {
    private(set) var shadows: [String: Bool] = [:]
    
    deinit {
        #if DEBUG
        print("\(String(describing: self)) is removed from memory")
        #endif
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        overrideUserInterfaceStyle = GeneralPreferences.shared.userInterfaceStyle
        view.backgroundColor = .primaryBackground
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        updateShadows()
    }
    
    func setBackButton(for navigationItem: UINavigationItem) {
        (navigationController as? BaseNavigationController)?.setupStyledBackButtonItem(for: navigationItem)
    }
    
    func addRightButton(for navigationItem: UINavigationItem, imageName: String, target: Any?, selector: Selector) {
        (navigationController as? BaseNavigationController)?.addRightBarButtonItem(for: navigationItem,
                                                                                   imageName: imageName,
                                                                                   target: target,
                                                                                   selector: selector)
    }
    
    func setNavigationTitle(_ title: String) {
        let label = Label()
        label.setFont(.headline)
        label.setTextColor(.primaryLabel)
        label.text = title
        label.sizeToFit()
        
        navigationItem.titleView = label
    }
    
    // MARK: - Shadow
    func registerDropShadow(_ label: String?) {
        guard let label = label else { return }
        shadows[label] = true
    }
    
    func canDropShadow(_ label: String?) -> Bool {
        guard let label = label else { return false }
        guard let canDrop = shadows[label] else { return false }
        
        return canDrop
    }
    
    func didDropShadow(_ label: String?) {
        guard let label = label else { return }
        shadows[label] = false
    }
}

@objc extension BaseViewController {
    func updateShadows() { }
}
