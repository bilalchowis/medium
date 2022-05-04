//
//  CreatePostViewController.swift
//  Medium
//
//  Created by Bilal Bakhrom on 04/05/2022.
//

import UIKit

protocol CreatePostDisplayLogic: AnyObject {
    /* DEFAULT */
}

class CreatePostViewController: BaseViewController, CreatePostDisplayLogic {
    var presenter: CreatePostPresentationLogic!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
}
