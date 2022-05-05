//
//  CreatePostRouter.swift
//  Medium
//
//  Created by Bilal Bakhrom on 04/05/2022.
//

protocol CreatePostRoutingLogic {
    /* DEFAULT */
}

class CreatePostRouter: BaseWireframe, CreatePostRoutingLogic {
    init(user: User) {
        let moduleViewController = CreatePostViewController()
        super.init(viewController: moduleViewController)
        
        let interactor = CreatePostInteractor(user: user)
        let presenter = CreatePostPresenter(view: moduleViewController, interactor: interactor, router: self)
        moduleViewController.presenter = presenter
    }
}
