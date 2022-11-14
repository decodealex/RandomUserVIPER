//
//  MockNetworkService.swift
//  RandomUsersVIPERTests
//
//  Created by Alex Kovalyshyn on 13.11.2022.
//

import XCTest
@testable import RandomUsersVIPER
@testable import RandomUserNetworkService

final class MockNetworkService: RandomUserNetworkService.NetworkServiceProtocol {
    
    var data: Data?
    
    func request(urlSession: URLSession, endpoint: RandomUserNetworkService.Endpoint) async throws -> Data {
        guard let data = data else {
            throw TestError.generic(description: "Data is nil")
        }
        return data
    }
    
}
