//
//  Post.swift
//  Medium
//
//  Created by Bilal Bakhrom on 05/05/2022.
//

import Foundation

struct Post: Codable, Identifiable {
    var id: String = UUID().uuidString
    var user: User
    var post: String
    var postImage: String?
}
