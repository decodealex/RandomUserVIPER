//
//  UserListPresenterTests.swift
//  RandomUsersVIPERTests
//
//  Created by Alex Kovalyshyn on 13.11.2022.
//

import XCTest
@testable import RandomUsersVIPER

final class UserListPresenterTests: XCTestCase {
    
    var presenter: UserListPresenter!
    var router: MockUserListRouter!
    var interactor: MockUserListInteractor!
    var expectation: XCTestExpectation?
    
    override func setUpWithError() throws {
        presenter = UserListPresenter()
        router = MockUserListRouter()
        interactor = MockUserListInteractor()
        router.viewController = UIViewController()
        presenter.router = router
        presenter.interactor = interactor
        interactor.output = presenter
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testViewDidLoad() {
        callViewDidload()
        
        XCTAssertEqual(presenter.users, mockUsers)
        XCTAssertEqual(presenter.users.count, mockUsers.count)
    }
    
    func testCalledInteractorGetusers() {
        callViewDidload()
        
        XCTAssertEqual(interactor.calledGetUsers, true)
    }
    
    func testViewState() {
        XCTAssertEqual(presenter.state, .loading)
        
        callViewDidload()
        
        XCTAssertEqual(presenter.state, .loaded)
    }
    
    func testViewControllerSetup() {
        callViewDidload()
        
        XCTAssertEqual(presenter.router.viewController?.title, "User List")
    }
    
    func testTappedOn() {
        let user = mockUsers[0]
        presenter.tappedOn(user)
        
        XCTAssertEqual(router.isUserDetailsSheetRequested, true)
        XCTAssertNotNil(router.user)
        XCTAssertEqual(router.user, user)
    }
    
    private func callViewDidload() {
        presenter.viewDidLoad()
        let exp = expectation(description: "Expect for refresh")
        let _ = XCTWaiter.wait(for: [exp], timeout: 0.01)
    }

}
