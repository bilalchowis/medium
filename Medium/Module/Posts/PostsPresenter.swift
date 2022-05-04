//
//  PostsPresenter.swift
//  Medium
//
//  Created by Bilal Bakhrom on 04/05/2022.
//

import UIKit

protocol PostsPresentationLogic: PresentationProtocol {
    /* DEFAULT */
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
        
    }
}
