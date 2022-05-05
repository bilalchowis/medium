//
//  UserCollectionCell.swift
//  Medium
//
//  Created by Bilal Bakhrom on 05/05/2022.
//

import UIKit

class UserCollectionCell: BaseCollectionViewCell {
    let dwgConst = DrawingConstants()
    
    private(set) lazy var containerView: UIView = {
        let view = UIView()
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.white.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private(set) lazy var userImageView: UIImageView = {
        let view = UIImageView()
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFill
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private(set) lazy var nameLabel: Label = {
        let view = Label()
        view.setFont(.body1)
        view.setTextColor(.primaryLabel)
        view.textAlignment = .center
        view.adjustsFontSizeToFitWidth = true
        view.minimumScaleFactor = 0.5
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
    }
    
    func focus(value: CGFloat) {
        self.nameLabel.transform = CGAffineTransform(scaleX: value, y: value)
        self.nameLabel.alpha = value
    }
    
    func configure(with viewModel: UserCollectionCellViewModel) {
        containerView.backgroundColor = viewModel.backgroundColor
        nameLabel.text = viewModel.name
        
        DispatchQueue.main.async {
            if let imagePath = viewModel.imagePath {
                self.userImageView.image = UIImage(named: imagePath)
            }
        }
    }
}
