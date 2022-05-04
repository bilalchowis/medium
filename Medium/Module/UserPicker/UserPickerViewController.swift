//
//  UserPickerViewController.swift
//  Medium
//
//  Created by Bilal Bakhrom on 04/05/2022.
//

import UIKit

protocol UserPickerDisplayLogic: AnyObject {
    /* DEFAULT */
}

class UserPickerViewController: BaseViewController, UserPickerDisplayLogic {
    let dwgConst = DrawingConstants()
    var presenter: UserPickerPresentationLogic!
    
    private(set) lazy var titleLabel: Label = {
        let view = Label()
        view.setFont(.title)
        view.setTextColor(.primaryLabel)
        view.setTitle("Medium".uppercased(), kern: 1.3)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        setupSubviews()
        presenter.viewDidLoad()
    }
}
