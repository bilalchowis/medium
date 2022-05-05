//
//  PostsPresenter.swift
//  Medium
//
//  Created by Bilal Bakhrom on 04/05/2022.
//

import UIKit

protocol PostsPresentationLogic: PresentationProtocol {
    func willOpenCreatePost()
}

class PostsPresenter: PostsPresentationLogic {
    private unowned var view: PostsDisplayLogic
    private var interactor: PostsBusinessLogic
    private var router: PostsRoutingLogic
    
    init(view: PostsDisplayLogic, interactor: PostsBusinessLogic, router: PostsRoutingLogic) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func viewDidLoad() {
        view.startLoader()
        willFetch()
        
        interactor.bind { [weak self] items in
            self?.view.addPost(items)
        }
    }
    
    func willFetch() {
        interactor.fetchPosts { [weak self] items in
            self?.view.updateUI(with: items)
        }
    }
    
    func willOpenCreatePost() {
        router.openCreatePost(interactor.user)
    }
}
