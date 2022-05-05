//
//  PostManager.swift
//  Medium
//
//  Created by Bilal Bakhrom on 06/05/2022.
//

import UIKit

class PostManager: SingleSourceProtocol {
    static var shared = PostManager()
    private(set) var posts: [Post] = []
    private let imageFactory = ImageFactory(directory: .post)
    
    lazy var folderURL: URL = {
        let docURL = FileManager.documentURL
        let folderURL = docURL.appendingPathComponent(Keys.folder.name)

        return folderURL
    }()

    var fileURL: URL {
        folderURL.appendingJSONComponent(Keys.jsonFile.name)
    }
    
    init() {
        try? FolderManager().createFolder(at: folderURL)
        fetch()
    }
    
    func kImageCache(_ post: Post) -> NSString {
        guard let imageName = post.postImage else { return "" }
        return NSString(string: imageName)
    }
    
    func cacheImages() {
        func cache() {
            posts.forEach { posts in
                guard let imageName = posts.postImage else { return }
                guard let image = imageFactory.image(named: imageName) else { return }

                imageCache.setObject(image, forKey: kImageCache(posts))
            }
        }
        
        DispatchQueue.global().async(execute: cache)
    }
    
    func addPost(_ post: Post) {
        posts.insert(post, at: 0)
        save()
    }
    
    /// Saves image locally in posts folder.
    /// - Parameter image: The post image.
    /// - Returns: Returns saved image's name.
    func save(image: UIImage) throws -> String {
        let imageName = imageFactory.generateImageName()
        try imageFactory.save(image: image, withName: imageName)
        
        return imageName
    }
    
    /// Returns image of specified name.
    func image(named name: String) -> UIImage? {
        imageFactory.image(named: name)
    }
    
    /// Fetches posts.
    func fetch() {
        // Check if post folder exists.
        if FolderManager().fileExists(at: fileURL) {
            do {
                posts = try JSONDecoder.decode([Post].self, from: fileURL)
            } catch {
                print("Error: \(error)")
                // Try to fetch after 2 seconds.
                DispatchQueue.global(qos: .background).asyncAfter(deadline: .now() + 2, execute: fetch)
            }
        } else {
            createTestablePosts()
        }
    }
    
    // Creates testable posts.
    private func createTestablePosts() {
        let imageFactory = ImageFactory(directory: .post)
        try? imageFactory.save(image: UIImage(named: "post-1")!, withName: "post-1")
        try? imageFactory.save(image: UIImage(named: "post-2")!, withName: "post-2")
        try? imageFactory.save(image: UIImage(named: "post-3")!, withName: "post-3")
        try? imageFactory.save(image: UIImage(named: "post-4")!, withName: "post-4")
        try? imageFactory.save(image: UIImage(named: "post-5")!, withName: "post-5")
        
        posts = [
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
        save()
    }

    private func save() {
        do {
            let data = try JSONEncoder().encode(posts)
            try data.write(to: fileURL, options: .atomic)
        } catch {
            print(error)
        }
    }
}
