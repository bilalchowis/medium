//
//  UserPickerViewController+Layout.swift
//  Medium
//
//  Created by Bilal Bakhrom on 04/05/2022.
//

import UIKit

extension UserPickerViewController {
    struct DrawingConstants {
        let titleLabelTop: CGFloat = 60
    }
    
    override func embedSubviews() {
        view.addSubview(titleLabel)
    }
    
    override func setSubviewsConstraints() {
        setTitleLabelConstraints()
    }
    
    // MARK: - Constraint
    private func setTitleLabelConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: dwgConst.titleLabelTop),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}
