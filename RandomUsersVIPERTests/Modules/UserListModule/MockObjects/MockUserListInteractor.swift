//
//  MockUserListInteractor.swift
//  RandomUsersVIPERTests
//
//  Created by Alex Kovalyshyn on 13.11.2022.
//

import Foundation
@testable import RandomUsersVIPER

class MockUserListInteractor: UserListInteractableInput {
    var output: RandomUsersVIPER.UserListInteractableOutput!
    var calledGetUsers = false
    
    func getUsers() {
        calledGetUsers = true
        output.received(mockUsers)
    }
    
}
