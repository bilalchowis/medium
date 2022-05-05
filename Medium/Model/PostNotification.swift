//
//  PostNotification.swift
//  Medium
//
//  Created by Bilal Bakhrom on 06/05/2022.
//

import Foundation

protocol PostNotificationName {
    var name: Notification.Name { get }
}

extension PostNotificationName where Self: RawRepresentable, RawValue == String {
    var name: Notification.Name {
        get {
            Notification.Name(rawValue)
        }
    }
}

enum PostNotification: String, PostNotificationName {
    case newPostAdded
    
    var key: String {
        self.rawValue
    }
}


extension NotificationCenter {
    func post(name aName: PostNotification, object anObject: Any? = nil) {
        self.post(name: aName.name, object: anObject)
    }
    
    func publisher(name aName: PostNotification) -> Publisher {
        publisher(for: aName.name)
    }
}
