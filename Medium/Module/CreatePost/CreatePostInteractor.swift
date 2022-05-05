//
//  CreatePostInteractor.swift
//  Medium
//
//  Created by Bilal Bakhrom on 04/05/2022.
//

import UIKit

protocol CreatePostBusinessLogic {
    func set(post: String)
    func set(image: UIImage)
    func submit()
}

class CreatePostInteractor: CreatePostBusinessLogic {
    let user: User
    private var postText: String = ""
    private var image: UIImage?
    private var imagePath: String?
    
    init(user: User) {
        self.user = user
    }
    
    func set(post: String) {
        self.postText = post
    }
    
    func set(image: UIImage) {
        self.image = image
    }
    
    func submit() {
        saveImage()
        Server().addPost(post: Post(id: UUID().uuidString,
                                    user: user,
                                    post: postText,
                                    postImage: imagePath)
        )
        
        NotificationCenter.default
            .post(name: .newPostAdded, object: nil)
    }
    
    func saveImage() {
        
    }
}
