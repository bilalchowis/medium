//
//  UserPickerPresenter.swift
//  Medium
//
//  Created by Bilal Bakhrom on 04/05/2022.
//

import UIKit

protocol UserPickerPresentationLogic: PresentationProtocol {
    func willOpenPosts(_ user: User)
}

class UserPickerPresenter: UserPickerPresentationLogic {
    private unowned var view: UserPickerDisplayLogic
    private var interactor: UserPickerBusinessLogic
    private var router: UserPickerRoutingLogic
    
    init(view: UserPickerDisplayLogic, interactor: UserPickerBusinessLogic, router: UserPickerRoutingLogic) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func viewDidLoad() {
        interactor.fetchUsers { [weak self] items in
            self?.view.updateUI(with: items)
        }
    }
    
    func willOpenPosts(_ user: User) {
        router.openPosts(user)
    }
}
