//
//  CreatePostInteractor.swift
//  Medium
//
//  Created by Bilal Bakhrom on 04/05/2022.
//

protocol CreatePostBusinessLogic {
    /* DEFAULT */
}

class CreatePostInteractor: CreatePostBusinessLogic {
    let user: User
    
    init(user: User) {
        self.user = user
    }
}
