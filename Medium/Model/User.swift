//
//  User.swift
//  Medium
//
//  Created by Bilal Bakhrom on 04/05/2022.
//

import Foundation

struct User: Codable, Identifiable {
    var id: String = UUID().uuidString
    var firstName: String
    var lastName: String
    var userName: String
    var imagePath: String?
    var postIDs: [String]
}
