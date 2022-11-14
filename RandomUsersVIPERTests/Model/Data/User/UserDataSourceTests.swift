//
//  UserDataSourceTests.swift
//  RandomUsersVIPERTests
//
//  Created by Alex Kovalyshyn on 13.11.2022.
//

import XCTest
@testable import RandomUsersVIPER

final class UserDataSourceTests: XCTestCase {
    
    let networkService = MockNetworkService()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        networkService.data = nil
    }

    func testGetUserList() async throws {
        let dataStore = UserRemoteDataSource(networkService)
        networkService.data = try getData(fromJSON: "users")
        
        let results = try await dataStore.getUserList(of: 40)
        let user = results[0]
        
        XCTAssertEqual(user.name.title, "Mrs")
        XCTAssertEqual(user.name.first, "Romy")
        XCTAssertEqual(user.name.last, "Beverwijk")
        XCTAssertEqual(user.name.fullName, "Mrs. Romy Beverwijk")
        XCTAssertEqual(user.email, "romy.beverwijk@example.com")
        XCTAssertEqual(user.picture.large.absoluteString, "https://randomuser.me/api/portraits/women/23.jpg")
    }


}
