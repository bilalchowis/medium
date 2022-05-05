//
//  PostsInteractor.swift
//  Medium
//
//  Created by Bilal Bakhrom on 04/05/2022.
//

protocol PostsBusinessLogic {
    /* DEFAULT */
}

class PostsInteractor: PostsBusinessLogic {
    let user: User
    
    init(user: User) {
        self.user = user
    }
}
