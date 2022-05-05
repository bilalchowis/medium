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
}
