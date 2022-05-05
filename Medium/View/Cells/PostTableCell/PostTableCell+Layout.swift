//
//  PostTableCell+Layout.swift
//  Medium
//
//  Created by Bilal Bakhrom on 05/05/2022.
//

import UIKit

extension PostTableCell {
    struct DrawingConstants {
        let hPadding: CGFloat = 20
        let vPadding: CGFloat = 20
        let hStackLeft: CGFloat = 12
        let hStackSpacing: CGFloat = 12
        let vStackSpacing: CGFloat = 16
        let userImageSize: CGFloat = 40
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        userImageView.layoutIfNeeded()
        userImageView.layer.cornerRadius = userImageView.bounds.height / 2
    }
    
    override func embedSubviews() {
        contentView.addSubview(userImageView)
        contentView.addSubview(hStack)
        contentView.addSubview(vStack)
        
        hStack.addArrangedSubview(nameLabel)
        hStack.addArrangedSubview(usernameLabel)
        
        vStack.addArrangedSubview(postLabel)
        vStack.addArrangedSubview(postImageView)
    }
    
    override func setSubviewsConstraints() {
        setUserImageViewConstraints()
        setHStackConstraints()
        setVStackConstraints()
    }
    
    // MARK: - Constraint
    private func setUserImageViewConstraints() {
        NSLayoutConstraint.activate([
            userImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: dwgConst.vPadding),
            userImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: dwgConst.hPadding),
            userImageView.widthAnchor.constraint(equalToConstant: dwgConst.userImageSize),
            userImageView.heightAnchor.constraint(equalToConstant: dwgConst.userImageSize)
        ])
    }
    
    private func setHStackConstraints() {
        NSLayoutConstraint.activate([
            hStack.topAnchor.constraint(equalTo: userImageView.topAnchor),
            hStack.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: dwgConst.hStackLeft),
            hStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -dwgConst.hPadding)
        ])
    }
    
    private func setVStackConstraints() {
        NSLayoutConstraint.activate([
            vStack.topAnchor.constraint(equalTo: hStack.bottomAnchor, constant: dwgConst.vPadding),
            vStack.leadingAnchor.constraint(equalTo: hStack.leadingAnchor),
            vStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -dwgConst.hPadding),
            vStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -dwgConst.vPadding)
        ])
    }
}
