//
//  Server.swift
//  Medium
//
//  Created by Bilal Bakhrom on 05/05/2022.
//

import Foundation

class Server {
    func fetchAccounts(completion: @escaping ([User]) -> Void) {
        let users: [User] = [
            User(id: 0,
                 firstName: "Elon",
                 lastName: "Mask",
                 userName: "engineer",
                 imagePath: "user-1"),
            User(id: 1,
                 firstName: "Tom",
                 lastName: "Cook",
                 userName: "boss",
                 imagePath: "user-2"),
            User(id: 2,
                 firstName: "Uncle",
                 lastName: "Bob",
                 userName: "procode",
                 imagePath: "user-3"),
            User(id: 3,
                 firstName: "Angelina",
                 lastName: "Jolie",
                 userName: "zirapcha",
                 imagePath: "user-4"),
            User(id: 4,
                 firstName: "Jennifer",
                 lastName: "Aniston",
                 userName: "shaddod",
                 imagePath: "user-5"),
            User(id: 5,
                 firstName: "Mark",
                 lastName: "Zuckerberg",
                 userName: "button",
                 imagePath: "user-6")
        ]
        
        completion(users)
    }
    
    func fetchPosts(completion: @escaping ([Post]) -> Void) {
        let posts: [Post] = [
            Post(user: User(id: 0,
                            firstName: "Elon",
                            lastName: "Mask",
                            userName: "engineer",
                            imagePath: "user-1"),
                 post: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu orci ac sapien finibus suscipit. Quisque quis erat ac metus tincidunt eleifend vel non nisi. Aliquam facilisis iaculis ornare.",
                 postImage: "post-1"),
            Post(user: User(id: 0,
                            firstName: "Elon",
                            lastName: "Mask",
                            userName: "engineer",
                            imagePath: "user-1"),
                 post: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu orci ac sapien finibus suscipit. Quisque quis erat ac metus tincidunt eleifend vel non nisi. Aliquam facilisis iaculis ornare.",
                 postImage: "post-2"),
            Post(user: User(id: 2,
                            firstName: "Uncle",
                            lastName: "Bob",
                            userName: "procode",
                            imagePath: "user-3"),
                 post: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu orci ac sapien finibus suscipit. Quisque quis erat ac metus tincidunt eleifend vel non nisi. Aliquam facilisis iaculis ornare.",
                 postImage: "post-3"),
            Post(user: User(id: 1,
                            firstName: "Tom",
                            lastName: "Cook",
                            userName: "boss",
                            imagePath: "user-2"),
                 post: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu orci ac sapien finibus suscipit. Quisque quis erat ac metus tincidunt eleifend vel non nisi. Aliquam facilisis iaculis ornare.",
                 postImage: "post-4"),
            Post(user: User(id: 3,
                            firstName: "Angelina",
                            lastName: "Jolie",
                            userName: "zirapcha",
                            imagePath: "user-4"),
                 post: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu orci ac sapien finibus suscipit. Quisque quis erat ac metus tincidunt eleifend vel non nisi. Aliquam facilisis iaculis ornare.",
                 postImage: "post-5"),
        ]
        
        completion(posts)
    }
    
    func addPost(post: Post) {
        
    }
}
