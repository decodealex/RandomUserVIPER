//
//  UserRepository.swift
//  RandomUsersVIPER
//
//  Created by Alex Kovalyshyn on 12.11.2022.
//

import Foundation

protocol UserRepositoryProtocol {
    mutating func getUserList(of count: Int) async throws -> [User]
}

struct UserRepository {
    private let remoteDataSource: UserRemoteDataSourceProtocol
    private var users: [User] = []
    
    init(_ remoteDataSource: UserRemoteDataSourceProtocol? = nil) {
        self.remoteDataSource = remoteDataSource ?? UserRemoteDataSource()
    }
}

extension UserRepository: UserRepositoryProtocol {
    mutating func getUserList(of count: Int) async throws -> [User] {
        users = try await remoteDataSource.getUserList(of: count)
        return users
    }
}
