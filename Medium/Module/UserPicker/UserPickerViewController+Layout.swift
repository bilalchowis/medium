//
//  UserPickerViewController+Layout.swift
//  Medium
//
//  Created by Bilal Bakhrom on 04/05/2022.
//

import UIKit

extension UserPickerViewController {
    struct DrawingConstants {
        let vPadding: CGFloat = 12
        let titleLabelTop: CGFloat = 60
        let scaleSize: CGFloat = 0.7
        let spacing: CGFloat = 20
        let buttonBottom: CGFloat = 32
        
        var itemSize: CGSize {
            let width = UIScreen.main.bounds.width * 0.35
            let height = width + 20
            
            return CGSize(width: width, height: height)
        }
        
        var collectionViewHeight: CGFloat {
            itemSize.height + vPadding * 2
        }
    }
    
    override func embedSubviews() {
        view.addSubview(vStack)
        view.addSubview(collectionView)
        view.addSubview(continueButton)
        
        vStack.addArrangedSubview(titleLabel)
        vStack.addArrangedSubview(descriptionLabel)
    }
    
    override func setSubviewsConstraints() {
        setVStackConstraints()
        setCollectionViewConstraints()
        setContinueButtonConstraints()
    }
    
    // MARK: - Constraint
    private func setVStackConstraints() {
        NSLayoutConstraint.activate([
            vStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: dwgConst.titleLabelTop),
            vStack.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func setCollectionViewConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: vStack.bottomAnchor, constant: dwgConst.vPadding),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: dwgConst.collectionViewHeight)
        ])
    }
    
    private func setContinueButtonConstraints() {
        NSLayoutConstraint.activate([
            continueButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            continueButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -dwgConst.buttonBottom)
        ])
    }
}
