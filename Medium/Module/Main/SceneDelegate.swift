//
//  SceneDelegate.swift
//  Medium
//
//  Created by Bilal Bakhrom on 04/05/2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        SceneManager.shared.set(window: UIWindow(windowScene: windowScene))
        SceneManager.shared.set(rootWireframe: UserPickerRouter())
    }
}

