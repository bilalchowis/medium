//
//  PostsViewController.swift
//  Medium
//
//  Created by Bilal Bakhrom on 04/05/2022.
//

import UIKit

protocol PostsDisplayLogic: AnyObject {
    func updateUI(with items: [PostTableCellViewModel])
}

class PostsViewController: BaseViewController, PostsDisplayLogic {
    var presenter: PostsPresentationLogic!
    private var items: [PostTableCellViewModel] = []
    
    private(set) lazy var tableView: UITableView = {
        let view = UITableView()
        view.register(PostTableCell.self)
        view.showsVerticalScrollIndicator = false
        view.delegate = self
        view.dataSource = self
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBackButton(for: navigationItem)
        addRightButton(for: navigationItem,
                       imageName: "plus",
                       target: self, selector: #selector(handleAddPostButtonClick))
        setupSubviews()
        presenter.viewDidLoad()
    }
    
    func updateUI(with items: [PostTableCellViewModel]) {
        self.items = items
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    // MARK: - Action
    @objc private func handleAddPostButtonClick() {
        
    }
}

extension PostsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        let cell = tableView.dequeueReusableCell(PostTableCell.self, for: indexPath)
        cell.configure(with: item)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}
