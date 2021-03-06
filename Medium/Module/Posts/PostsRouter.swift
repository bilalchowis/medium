//
//  PostsRouter.swift
//  Medium
//
//  Created by Bilal Bakhrom on 04/05/2022.
//

protocol PostsRoutingLogic {
    func openCreatePost(_ user: User)
}

class PostsRouter: BaseWireframe, PostsRoutingLogic {
    init(user: User) {
        let moduleViewController = PostsViewController()
        super.init(viewController: moduleViewController)
        
        let interactor = PostsInteractor(user: user)
        let presenter = PostsPresenter(view: moduleViewController, interactor: interactor, router: self)
        moduleViewController.presenter = presenter
    }
    
    func openCreatePost(_ user: User) {
        let router = CreatePostRouter(user: user)
        navigationController?.pushWireframe(router)
    }
}
