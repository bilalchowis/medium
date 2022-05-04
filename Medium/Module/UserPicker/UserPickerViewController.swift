//
//  UserPickerViewController.swift
//  Medium
//
//  Created by Bilal Bakhrom on 04/05/2022.
//

import UIKit

protocol UserPickerDisplayLogic: AnyObject {
    /* DEFAULT */
}

class UserPickerViewController: BaseViewController, UserPickerDisplayLogic {
    var presenter: UserPickerPresentationLogic!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
}
