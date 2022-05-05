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
    }
    
    override func setSubviewsConstraints() {
        setTableViewConstraints()
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
}
