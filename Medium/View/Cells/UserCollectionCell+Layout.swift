//
//  UserCollectionCell+Layout.swift
//  Medium
//
//  Created by Bilal Bakhrom on 05/05/2022.
//

import UIKit

extension UserCollectionCell {
    struct DrawingConstants {
        let hPadding: CGFloat = 6
        let spacing: CGFloat = 4
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        userImageView.layoutIfNeeded()
        userImageView.layer.cornerRadius = userImageView.bounds.height / 2
        
        containerView.layoutIfNeeded()
        containerView.layer.cornerRadius = containerView.bounds.height / 2
    }
    
    override func embedSubviews() {
        contentView.addSubview(containerView)
        contentView.addSubview(nameLabel)
        containerView.addSubview(userImageView)
    }
    
    override func setSubviewsConstraints() {
        setNameLabelConstraints()
        setContainerViewConstraints()
        setUserImageViewConstraints()
    }
    
    // MARK: - Constraint
    private func setNameLabelConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: dwgConst.hPadding),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -dwgConst.hPadding),
            nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    private func setContainerViewConstraints() {
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: nameLabel.topAnchor, constant: -dwgConst.spacing)
        ])
    }
    
    private func setUserImageViewConstraints() {
        NSLayoutConstraint.activate([
            userImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            userImageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            userImageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            userImageView.heightAnchor.constraint(equalTo: userImageView.widthAnchor)
        ])
    }
}
