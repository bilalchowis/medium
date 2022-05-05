//
//  PostsViewController+Layout.swift
//  Medium
//
//  Created by Bilal Bakhrom on 04/05/2022.
//

import UIKit

extension PostsViewController {
    struct DrawingConstants {
        
    }
    
    override func embedSubviews() {
        view.addSubview(tableView)
        view.addSubview(loader)
    }
    
    override func setSubviewsConstraints() {
        setTableViewConstraints()
        setLoaderConstraints()
    }
    
    // MARK: - Constraint
    private func setTableViewConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func setLoaderConstraints() {
        NSLayoutConstraint.activate([
            loader.centerXAnchor.constraint(equalTo: tableView.centerXAnchor),
            loader.centerYAnchor.constraint(equalTo: tableView.centerYAnchor)
        ])
    }
}
