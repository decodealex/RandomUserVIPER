//
//  MockUserListRouter.swift
//  RandomUsersVIPERTests
//
//  Created by Alex Kovalyshyn on 13.11.2022.
//

import UIKit
@testable import RandomUsersVIPER

class MockUserListRouter: UserListRoutable {
    var viewController: UIViewController?
    var isUserDetailsSheetRequested = false
    var user: RandomUsersVIPER.User? = nil
    
    func presentUserDetailsSheet(for user: RandomUsersVIPER.User) {
        isUserDetailsSheetRequested = true
        self.user = user
    }
}

