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
    init() {
        let moduleViewController = CreatePostViewController()
        super.init(viewController: moduleViewController)
        
        let interactor = CreatePostInteractor()
        let presenter = CreatePostPresenter(view: moduleViewController, interactor: interactor, router: self)
        moduleViewController.presenter = presenter
    }
}
