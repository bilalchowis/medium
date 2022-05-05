//
//  UserPickerInteractor.swift
//  Medium
//
//  Created by Bilal Bakhrom on 04/05/2022.
//

import Foundation

protocol UserPickerBusinessLogic {
    func fetchUsers(completion: @escaping ([UserCollectionCellViewModel]) -> Void)
}

class UserPickerInteractor: UserPickerBusinessLogic {
    func fetchUsers(completion: @escaping ([UserCollectionCellViewModel]) -> Void) {
        let users: [User] = [
            User(id: UUID().uuidString, firstName: "Elon", lastName: "Mask", imagePath: "user-1", postIDs: []),
            User(id: UUID().uuidString, firstName: "Tom", lastName: "Cook", imagePath: "user-2", postIDs: []),
            User(id: UUID().uuidString, firstName: "Uncle", lastName: "Bob", imagePath: "user-3", postIDs: []),
            User(id: UUID().uuidString, firstName: "Angelina", lastName: "Jolie", imagePath: "user-4", postIDs: []),
            User(id: UUID().uuidString, firstName: "Jennifer", lastName: "Aniston", imagePath: "user-5", postIDs: []),
            User(id: UUID().uuidString, firstName: "Mark", lastName: "Zuckerberg", imagePath: "user-6", postIDs: [])
        ]
        
        let vmsForUserCell = users.map(UserCollectionCellViewModel.init)
        completion(vmsForUserCell)
    }
}
