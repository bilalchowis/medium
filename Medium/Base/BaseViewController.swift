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
        (navigationController as? BaseNavigationController)?.setupStyledBackButtonItem(for: navigationItem)
    }
}
