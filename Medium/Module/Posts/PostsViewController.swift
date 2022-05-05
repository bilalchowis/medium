//
//  PostsViewController.swift
//  Medium
//
//  Created by Bilal Bakhrom on 04/05/2022.
//

import UIKit

protocol PostsDisplayLogic: AnyObject {
    /* DEFAULT */
}

class PostsViewController: BaseViewController, PostsDisplayLogic {
    var presenter: PostsPresentationLogic!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBackButton(for: navigationItem)
        setupSubviews()
        presenter.viewDidLoad()
    }
}
