//
//  CreatePostPresenter.swift
//  Medium
//
//  Created by Bilal Bakhrom on 04/05/2022.
//

import UIKit

protocol CreatePostPresentationLogic: PresentationProtocol {
    /* DEFAULT */
}

class CreatePostPresenter: CreatePostPresentationLogic {
    private unowned var view: CreatePostDisplayLogic
    private var interactor: CreatePostBusinessLogic
    private var router: CreatePostRoutingLogic
    
    init(view: CreatePostDisplayLogic, interactor: CreatePostBusinessLogic, router: CreatePostRoutingLogic) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func viewDidLoad() {
        
    }
}
