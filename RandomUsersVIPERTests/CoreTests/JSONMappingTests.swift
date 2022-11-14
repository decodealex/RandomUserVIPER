//
//  JSONMappingTests.swift
//  RandomUsersVIPERTests
//
//  Created by Alex Kovalyshyn on 13.11.2022.
//

import XCTest
@testable import RandomUsersVIPER

final class JSONMappingTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    let decoder: JSONDecoder = JSONDecoder.defaultDecoder

    func testUserDecodingTest() throws {
        let data = try getData(fromJSON: "users")
        let results = try decoder.decode(UsersContainer.self, from: data).results
        let user = results[0]
        
        
        XCTAssertEqual(user.name.title, "Mrs")
        XCTAssertEqual(user.name.first, "Romy")
        XCTAssertEqual(user.name.last, "Beverwijk")
        XCTAssertEqual(user.name.fullName, "Mrs. Romy Beverwijk")
        XCTAssertEqual(user.email, "romy.beverwijk@example.com")
        XCTAssertEqual(user.picture.large.absoluteString, "https://randomuser.me/api/portraits/women/23.jpg")
    }

}
