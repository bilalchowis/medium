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
            User(firstName: "Elon",
                 lastName: "Mask",
                 userName: "engineer",
                 imagePath: "user-1",
                 postIDs: []),
            User(firstName: "Tom",
                 lastName: "Cook",
                 userName: "boss",
                 imagePath: "user-2",
                 postIDs: []),
            User(firstName: "Uncle",
                 lastName: "Bob",
                 userName: "procode",
                 imagePath: "user-3",
                 postIDs: []),
            User(firstName: "Angelina",
                 lastName: "Jolie",
                 userName: "zirapcha",
                 imagePath: "user-4",
                 postIDs: []),
            User(firstName: "Jennifer",
                 lastName: "Aniston",
                 userName: "shaddod",
                 imagePath: "user-5",
                 postIDs: []),
            User(firstName: "Mark",
                 lastName: "Zuckerberg",
                 userName: "button",
                 imagePath: "user-6",
                 postIDs: [])
        ]
        
        let vmsForUserCell = users.map(UserCollectionCellViewModel.init)
        completion(vmsForUserCell)
    }
}
