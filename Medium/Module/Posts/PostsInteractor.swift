//
//  PostsInteractor.swift
//  Medium
//
//  Created by Bilal Bakhrom on 04/05/2022.
//

import Foundation

protocol PostsBusinessLogic {
    var user: User { get }
    func fetchPosts(completion: @escaping ([PostTableCellViewModel]) -> Void)
}

class PostsInteractor: PostsBusinessLogic {
    let user: User
    private let server = Server()
    
    init(user: User) {
        self.user = user
    }
    
    func fetchPosts(completion: @escaping ([PostTableCellViewModel]) -> Void) {
        DispatchQueue.global().async {
            self.server.fetchPosts { posts in
                completion(posts.map(PostTableCellViewModel.init))
            }
        }
    }
}
