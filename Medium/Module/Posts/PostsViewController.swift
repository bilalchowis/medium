//
//  PostsViewController.swift
//  Medium
//
//  Created by Bilal Bakhrom on 04/05/2022.
//

import UIKit

protocol PostsDisplayLogic: AnyObject {
    func startLoader()
    func stopLoader()
    func addPost(_ items: [PostTableCellViewModel])
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
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private(set) lazy var loader: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(style: .medium)
        view.translatesAutoresizingMaskIntoConstraints =  false
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .primaryBackground
        setNavigationTitle("Posts")
        setBackButton(for: navigationItem)
        addRightButton(for: navigationItem,
                       imageName: "plus",
                       target: self, selector: #selector(handleAddPostButtonClick))
        setupSubviews()
        presenter.viewDidLoad()
    }
    
    func startLoader() {
        loader.startAnimating()
    }
    
    func stopLoader() {
        loader.stopAnimating()
    }
    
    func addPost(_ items: [PostTableCellViewModel]) {
        self.items = items
        
        DispatchQueue.main.async {
            self.tableView.beginUpdates()
            self.tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .none)
            self.tableView.endUpdates()
        }
    }
    
    func updateUI(with items: [PostTableCellViewModel]) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.stopLoader()
            self.items = items
            self.tableView.reloadData()
        }
    }
    
    // MARK: - Action
    @objc private func handleAddPostButtonClick() {
        presenter.willOpenCreatePost()
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
