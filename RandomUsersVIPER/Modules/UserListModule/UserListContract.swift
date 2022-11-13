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
    
    func viewDidLoad()
    func viewDidAppear()
}

/// Business logic and handles data requests and delegate transfer
protocol UserListInteractableInput: class {
    var output: UserListInteractableOutput! { get }
    

}

/// Handles data response transfer
protocol UserListInteractableOutput: class {
    

}

/// Handles navigation
protocol UserListRoutable: class {
    var viewController: UIViewController? { get }
    

}
