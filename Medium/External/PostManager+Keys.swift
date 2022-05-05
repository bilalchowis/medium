//
//  PostManager+Keys.swift
//  Medium
//
//  Created by Bilal Bakhrom on 06/05/2022.
//

import Foundation

extension PostManager {
    enum Keys: String {
        case jsonFile = "_posts"
        case folder = "users-post"
        
        var name: String {
            self.rawValue
        }
    }
}
