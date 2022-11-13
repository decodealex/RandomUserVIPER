//
//  UserDetailsContract.swift
//  RandomUsersVIPER
//
//  Created by Alex Kovalyshyn on 12.11.2022.
//  
//

import UIKit
import SwiftUI

/// Handles user interaction
protocol UserDetailsPresentable: ObservableObject {
    var interactor: UserDetailsInteractableInput! { get }
    var router: UserDetailsRoutable! { get }
    
    var user: User? { get }
    var rows: [UserDetailRowModel] { get }
    
    func viewDidLoad()
    func viewDidAppear()
    
    func tappedEmail()
}

/// Business logic and handles data requests and delegate transfer
protocol UserDetailsInteractableInput: AnyObject {
    var output: UserDetailsInteractableOutput! { get }
    
    func getUser()
    func getRows()
}

/// Handles data response transfer
protocol UserDetailsInteractableOutput: AnyObject {
    func receivedUser(_ user: User)
    func receivedRows(_ rows: [UserDetailRowModel])
}

/// Handles navigation
protocol UserDetailsRoutable: AnyObject {
    var viewController: UIViewController? { get }
    

}
