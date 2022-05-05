//
//  CreatePostViewController.swift
//  Medium
//
//  Created by Bilal Bakhrom on 04/05/2022.
//

import UIKit

protocol CreatePostDisplayLogic: AnyObject {
    /* DEFAULT */
}

class CreatePostViewController: BaseViewController, CreatePostDisplayLogic {
    let dwgConst = DrawingConstants()
    var presenter: CreatePostPresentationLogic!
    
    private(set) lazy var contentView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = dwgConst.cornerRadius
        view.backgroundColor = .secondaryBackground
        view.accessibilityLabel = "contentView"
        view.translatesAutoresizingMaskIntoConstraints = false
        registerDropShadow(view.accessibilityLabel)
        
        return view
    }()
    
    private(set) lazy var textView: TextView = {
        let view = TextView()
        view.setFont(.body1)
        view.setTextColor(.primaryLabel)
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private(set) lazy var imageButton: UIButton = {
        let view = UIButton()
        view.setImage(UIImage(named: "img_add"), for: .normal)
        view.imageView?.contentMode = .scaleAspectFill
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private(set) lazy var submitButton: Button = {
        let view = Button()
        view.setTitle("Submit", for: .normal)
        view.addTarget(self, action: #selector(handleSubmitButtonClick), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .primaryBackground
        setBackButton(for: navigationItem)
        setNavigationTitle("Create Post")
        setupSubviews()
        presenter.viewDidLoad()
    }
    
    // MARK: - Action
    @objc private func handleImageButtonClick() {
        
    }
    
    @objc private func handleSubmitButtonClick() {
        
    }
}
