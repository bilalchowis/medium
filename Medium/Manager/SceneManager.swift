//
//  SceneManager.swift
//  Medium
//
//  Created by Bilal Bakhrom on 04/05/2022.
//

import UIKit

final class SceneManager {
    /// Global instance of  SceneManager
    static let shared: SceneManager = SceneManager()
    /// The app's backdrop
    private(set) var window: UIWindow!
    /// The set of navigation controllers for tab bar viewControllers
    private(set) var navigationController: BaseNavigationController?
        
    private init() {}
    
    /// Sets the window
    func set(window: UIWindow) {
        self.window = window
    }
    
    /// Updates root view controller of window. Shows the window and makes it the key window.
    func set(rootViewController: UIViewController) {
        navigationController = makeNavController(rootViewController: rootViewController)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
    /// Updates root view controller of window with wireframe's view controller. Shows the window and makes it the key window.
    func set(rootWireframe: BaseWireframe) {
        navigationController = makeNavController(rootViewController: rootWireframe.viewController)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
    /// Pushes a view controller onto the receiver’s stack and updates the display.
    func push(_ viewController: UIViewController, animated: Bool = true) {
        navigationController?.pushViewController(viewController, animated: animated)
    }
    
    /// Pushes a wire frame's view controller onto the receiver’s stack and updates the display.
    func push(_ wireframe: BaseWireframe, animated: Bool = true) {
        navigationController?.pushWireframe(wireframe, animated: animated)
    }
    
    /// Pops the top view controller from the navigation stack and updates the display.
    func popViewController() {
        navigationController?.popViewController(animated: true)
    }
    
    /// Sets whether the navigation bar of given tab bar item is hidden
    func setNavigationBarHidden(_ hidden: Bool, animated: Bool = true) {
        navigationController?.setNavigationBarHidden(hidden, animated: animated)
    }
    
    // MARK: - SUPPORT
    func makeNavController<T: UINavigationController>(
        rootViewController: UIViewController
    ) -> T {
        let navController = T(rootViewController: rootViewController)
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.backgroundColor = .clear
        navBarAppearance.shadowColor = nil
        navController.navigationBar.tintColor = .white
        navController.navigationBar.isTranslucent = true
        navController.navigationBar.standardAppearance = navBarAppearance
        return navController
    }

    var topViewController: UIViewController? {
        let keyWindow = UIApplication.shared.windows.first{$0.isKeyWindow}
        guard let window = keyWindow, let rootViewController = window.rootViewController else { return nil }
        var topController = rootViewController

        while let newTopController = topController.presentedViewController {
            topController = newTopController
        }

        return topController
    }
}

