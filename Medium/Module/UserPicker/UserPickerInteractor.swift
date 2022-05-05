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
        Server().fetchAccounts { users in
            completion(users.map(UserCollectionCellViewModel.init))
        }        
    }
}
