//
//  PostsRouter.swift
//  Medium
//
//  Created by Bilal Bakhrom on 04/05/2022.
//

protocol PostsRoutingLogic {
    /* DEFAULT */
}

class PostsRouter: BaseWireframe, PostsRoutingLogic {
    init() {
        let moduleViewController = PostsViewController()
        super.init(viewController: moduleViewController)
        
        let interactor = PostsInteractor()
        let presenter = PostsPresenter(view: moduleViewController, interactor: interactor, router: self)
        moduleViewController.presenter = presenter
    }
}
