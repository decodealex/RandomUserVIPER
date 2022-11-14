//
//  MockUsers.swift
//  RandomUsersVIPERTests
//
//  Created by Alex Kovalyshyn on 13.11.2022.
//

import Foundation
@testable import RandomUsersVIPER

let mockUsers: [RandomUsersVIPER.User] = [
    User(name: User.Name(title: "Mr",
                         first: "Test",
                         last: "User"),
         email: "test@gmail.com",
         picture: User.Picture(large: URL(string: "https://randomuser.me/api/portraits/med/women/23.jpg")!)),
    User(name: User.Name(title: "Miss",
                         first: "Kate",
                         last: "Redbull"),
         email: "redbull@gmail.com",
         picture: User.Picture(large: URL(string: "https://randomuser.me/api/portraits/med/women/10.jpg")!)),
    User(name: User.Name(title: "Mr",
                         first: "James",
                         last: "Bond"),
         email: "bond@gmail.com",
         picture: User.Picture(large: URL(string: "https://randomuser.me/api/portraits/med/men/60.jpg")!)),
    User(name: User.Name(title: "Mr.",
                         first: "Bill",
                         last: "Gates"),
         email: "gates@gmail.com",
         picture: User.Picture(large: URL(string: "https://randomuser.me/api/portraits/med/men/40.jpg")!)),
]
