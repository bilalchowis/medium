//
//  PostTableCellViewModel.swift
//  Medium
//
//  Created by Bilal Bakhrom on 05/05/2022.
//

class PostTableCellViewModel {
    let post: Post
    
    var userImage: String {
        post.user.imagePath ?? ""
    }
    
    var name: String {
        post.user.firstName
    }
    
    var username: String {
        "@\(post.user.userName)"
    }
    
    var text: String {
        post.post
    }
    
    var postImage: String? {
        post.postImage
    }
    
    init(post: Post) {
        self.post = post
    }
}
