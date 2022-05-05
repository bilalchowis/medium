//
//  PostTableCell.swift
//  Medium
//
//  Created by Bilal Bakhrom on 05/05/2022.
//

import UIKit

class PostTableCell: BaseTableViewCell {
    let dwgConst = DrawingConstants()
    
    private(set) lazy var userImageView: UIImageView = {
        let view = UIImageView()
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 1
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private(set) lazy var nameLabel: Label = {
        let view = Label()
        view.setFont(.body1)
        view.setTextColor(.primaryLabel)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private(set) lazy var usernameLabel: Label = {
        let view = Label()
        view.setFont(.body1)
        view.setTextColor(.secondaryLabel)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private(set) lazy var hStack: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.spacing = dwgConst.hStackSpacing
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private(set) lazy var postLabel: Label = {
        let view = Label()
        view.setFont(.body1)
        view.setTextColor(.primaryLabel)
        view.numberOfLines = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private(set) lazy var postImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private(set) lazy var vStack: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = dwgConst.vStackSpacing
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubviews()
    }
    
    func configure(with viewModel: PostTableCellViewModel) {
        
    }
}
