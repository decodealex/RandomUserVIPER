//
//  UserRemoteDataSource.swift
//  RandomUsersVIPER
//
//  Created by Alex Kovalyshyn on 12.11.2022.
//

import Foundation

protocol UserRemoteDataSourceProtocol {
    func getUserList(of count: Int) async throws -> [User]
}

struct UserRemoteDataSource{
    private let networkService: NetworkServiceProtocol
    private let decoder: JSONDecoder
    
    init(_ networkService: NetworkServiceProtocol = NetworkService.shared, decoder: JSONDecoder = .defaultDecoder) {
        self.networkService = networkService
        self.decoder = decoder
    }
}

extension UserRemoteDataSource: UserRemoteDataSourceProtocol {
    func getUserList(of count: Int) async throws -> [User] {
        let data = try await networkService.request(urlSession: .shared, endpoint: UserEndpoint.getUserList(count: count))
        let usersPayload = try decoder.decode(UsersContainer.self, from: data)
        return usersPayload.results
    }
}
