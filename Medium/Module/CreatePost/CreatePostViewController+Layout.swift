//
//  CreatePostViewController+Layout.swift
//  Medium
//
//  Created by Bilal Bakhrom on 04/05/2022.
//

import UIKit

extension CreatePostViewController {
    struct DrawingConstants {
        let hPadding: CGFloat = 30
        let vPadding: CGFloat = 20
        let hTextPadding: CGFloat = 12
        let vTextPadding: CGFloat = 12
        let imageButtonSize: CGFloat = 80
        let submitButtonBottom: CGFloat = 32
        let cornerRadius: CGFloat = 12
    }
    
    override func updateShadows() {
        if canDropShadow(contentView.accessibilityLabel) {
            contentView.dropShadow(blur: 20, cornerRadius: dwgConst.cornerRadius)
            didDropShadow(contentView.accessibilityLabel)
        }
    }
    
    override func embedSubviews() {
        view.addSubview(contentView)
        view.addSubview(imageButton)
        view.addSubview(submitButton)
        contentView.addSubview(textView)
    }
    
    override func setSubviewsConstraints() {
        setContentViewConstraints()
        setTextViewConstraints()
        setImageButtonConstraints()
        setSubmitButtonConstraints()
    }
    
    // MARK: - Constraint
    private func setContentViewConstraints() {
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: dwgConst.vPadding),
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: dwgConst.hPadding),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -dwgConst.hPadding)
        ])
    }
    
    private func setTextViewConstraints() {
        NSLayoutConstraint.activate([
            textView.topAnchor.constraint(equalTo: contentView.topAnchor),
            textView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: dwgConst.hTextPadding),
            textView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -dwgConst.hTextPadding),
            textView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -dwgConst.vTextPadding)
        ])
    }
    
    private func setImageButtonConstraints() {
        NSLayoutConstraint.activate([
            imageButton.topAnchor.constraint(equalTo: contentView.bottomAnchor, constant: dwgConst.vPadding),
            imageButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: dwgConst.hPadding),
            imageButton.widthAnchor.constraint(equalToConstant: dwgConst.imageButtonSize),
            imageButton.heightAnchor.constraint(equalToConstant: dwgConst.imageButtonSize)
        ])
    }
    
    private func setSubmitButtonConstraints() {
        NSLayoutConstraint.activate([
            submitButton.topAnchor.constraint(equalTo: imageButton.bottomAnchor, constant: dwgConst.vPadding),
            submitButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            submitButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -dwgConst.submitButtonBottom)
        ])
    }
}
