//
//  BaseWireframe.swift
//  Medium
//
//  Created by Bilal Bakhrom on 04/05/2022.
//

import UIKit.UIViewController

class BaseWireframe {
    private unowned var _viewController: UIViewController
    // To retain view controller reference upon first access
    private var temporaryViewController: UIViewController?
    
    init(viewController: UIViewController) {
        temporaryViewController = viewController
        _viewController = viewController
    }
}

extension BaseWireframe {
    var viewController: UIViewController {
        defer { temporaryViewController = nil }
        return _viewController
    }
    
    
    var navigationController: UINavigationController? {
        return viewController.navigationController
    }
}

extension UIViewController {
    func presentWireframe(_ wireframe: BaseWireframe, animated: Bool = true, completion: (()->())? = nil) {
        present(wireframe.viewController, animated: animated, completion: completion)
    }
}

extension UINavigationController {
    func pushWireframe(_ wireframe: BaseWireframe, animated: Bool = true) {
        pushViewController(wireframe.viewController, animated: animated)
    }

    func setRootWireframe(_ wireframe: BaseWireframe, animated: Bool = true) {
        setViewControllers([wireframe.viewController], animated: animated)
    }
}

