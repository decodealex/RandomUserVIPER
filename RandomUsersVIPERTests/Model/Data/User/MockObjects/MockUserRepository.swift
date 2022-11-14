//
//  MockUserRepository.swift
//  RandomUsersVIPERTests
//
//  Created by Alex Kovalyshyn on 13.11.2022.
//

import Foundation
@testable import RandomUsersVIPER

struct MockUserRepository: RandomUsersVIPER.UserRepositoryProtocol {
    mutating func getUserList(of count: Int) async throws -> [RandomUsersVIPER.User] {
        return mockUsers
    }
}
