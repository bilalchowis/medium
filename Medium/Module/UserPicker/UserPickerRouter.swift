//
//  UserPickerRouter.swift
//  Medium
//
//  Created by Bilal Bakhrom on 04/05/2022.
//

protocol UserPickerRoutingLogic {
    func openPosts(_ user: User)
}

class UserPickerRouter: BaseWireframe, UserPickerRoutingLogic {
    init() {
        let moduleViewController = UserPickerViewController()
        super.init(viewController: moduleViewController)
        
        let interactor = UserPickerInteractor()
        let presenter = UserPickerPresenter(view: moduleViewController, interactor: interactor, router: self)
        moduleViewController.presenter = presenter
    }
    
    func openPosts(_ user: User) {
        let router = PostsRouter(user: user)
        navigationController?.pushWireframe(router)
    }
}
