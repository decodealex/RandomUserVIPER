//
//  UserListContract.swift
//  RandomUsersVIPER
//
//  Created by Alex Kovalyshyn on 12.11.2022.
//  
//

import UIKit
import SwiftUI

/// Handles user interaction
protocol UserListPresentable: ObservableObject {
    var interactor: UserListInteractableInput! { get }
    var router: UserListRoutable! { get }
    
    var users: [User] { get }
    var state: UserListViewState { get }
    
    func viewDidLoad()
    func viewDidAppear()
    
    func tappedOn(_ user: User)
}

/// Business logic and handles data requests and delegate transfer
protocol UserListInteractableInput: AnyObject {
    var output: UserListInteractableOutput! { get }
    
    func getUsers()
}

/// Handles data response transfer
protocol UserListInteractableOutput: AnyObject {
    func received(_ users: [User])
}

/// Handles navigation
protocol UserListRoutable: AnyObject {
    var viewController: UIViewController? { get }
    
    func presentUserDetailsSheet(for user: User)
}
