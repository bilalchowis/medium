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
    private var imageName: String?
    private let imageFactory = ImageFactory(directory: .post)
    
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
        addPost(post: generatePost())
        publishPost()
    }
    
    private func addPost(post: Post) {
        Server().addPost(post: post)
    }
    
    private func publishPost() {
        NotificationCenter.default
            .post(name: .newPostAdded, object: nil)
    }
    
    private func generatePost() -> Post {
        Post(id: UUID().uuidString,
             user: user,
             post: postText,
             postImage: imageName)
    }
    
    private func saveImage() {
        guard let image = image else { return }
        
        let imageName = imageFactory.generateImageName()
        try? imageFactory.save(image: image, withName: imageName)
        self.imageName = imageName
    }
}
