//
//  PostsInteractor.swift
//  Medium
//
//  Created by Bilal Bakhrom on 04/05/2022.
//

import Foundation
import Combine

protocol PostsBusinessLogic {
    var user: User { get }
    
    func fetchPosts(completion: @escaping ([PostTableCellViewModel]) -> Void)
    func bind(completion: @escaping () -> Void)
}

class PostsInteractor: PostsBusinessLogic {
    let user: User
    private let server = Server()
    private var subscriptions: Set<AnyCancellable> = []
    
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
    
    func bind(completion: @escaping () -> Void) {
        NotificationCenter.default
            .publisher(name: .newPostAdded)
            .sink { _ in
                completion()
            }
            .store(in: &subscriptions)
    }
}
