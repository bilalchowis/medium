//
//  PostsViewController.swift
//  Medium
//
//  Created by Bilal Bakhrom on 04/05/2022.
//

import UIKit

protocol PostsDisplayLogic: AnyObject {
    
}

class PostsViewController: BaseViewController, PostsDisplayLogic {
    var presenter: PostsPresentationLogic!
    
    private(set) lazy var tableView: UITableView = {
        let view = UITableView()
        view.register(PostTableCell.self)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBackButton(for: navigationItem)
        setupSubviews()
        presenter.viewDidLoad()
    }
}
