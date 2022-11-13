//
//  User.swift
//  RandomUsersVIPER
//
//  Created by Alex Kovalyshyn on 12.11.2022.
//

import Foundation

struct User: Codable, Hashable {
    let name: Name
    let email: String
    let picture: Picture
}

extension User {
    struct Name: Codable, Hashable {
        let title: String
        let first: String
        let last: String
        
        var fullName: String { "\(title). \(first) \(last)"}
    }
    
    struct Picture: Codable, Hashable {
        let medium: URL
    }
}

struct UsersContainer: Codable {
    let results: [User]
}
