//
//  BaseTableViewCell.swift
//  Medium
//
//  Created by Bilal Bakhrom on 05/05/2022.
//

import UIKit

class BaseTableViewCell: UITableViewCell {
    private(set) var shadows: [String: Bool] = [:]
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
        
    @available(*, unavailable)
    required public init?(coder: NSCoder) {
        fatalError()
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        updateShadows()
    }
    
    func registerDropShadow(_ label: String?) {
        guard let label = label else { return }
        shadows[label] = true
    }
    
    func canDropShadow(_ label: String?) -> Bool {
        guard let label = label else { return false }
        guard let canDrop = shadows[label] else { return false }
        
        return canDrop
    }
    
    func didDropShadow(_ label: String?) {
        guard let label = label else { return }
        shadows[label] = false
    }
}

@objc extension BaseTableViewCell {
    func updateShadows() { }
}
