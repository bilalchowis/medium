//
//  UserCollectionCellViewModel.swift
//  Medium
//
//  Created by Bilal Bakhrom on 05/05/2022.
//

import UIKit

class UserCollectionCellViewModel {
    let user: User
    var backgroundColor: UIColor = .clear
     
    var name: String {
        "\(user.firstName) \(user.lastName)"
    }
    
    var imagePath: String? {
        user.imagePath
    }
    
    init(user: User) {
        self.user = user
        self.backgroundColor = generateRandomColor()
    }
    
    func generateRandomColor() -> UIColor {
        let colors: [UIColor] = [.blue, .yellow, .brown, .orange, .purple, .accent, .cardinal, .mainBlue]
        let randomIndex = Int.random(in: 0..<colors.count)
        
        return colors[randomIndex]
    }
}
