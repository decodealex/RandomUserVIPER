//
//  UserDetailsInteractor.swift
//  RandomUsersVIPER
//
//  Created by Alex Kovalyshyn on 12.11.2022.
//  
//

import Foundation

class UserDetailsInteractor: UserDetailsInteractableInput {
    weak var output: UserDetailsInteractableOutput!
    
    var user: User
    
    init(for user: User) {
        self.user = user
    }

    func getUser() {
        output.receivedUser(user)
    }
    
    func getRows() {
        let rows = [
            UserDetailRowModel(title: "First name:", value: user.name.first),
            UserDetailRowModel(title: "Last name:", value: user.name.last)
        ]
        output.receivedRows(rows)
    }
}
