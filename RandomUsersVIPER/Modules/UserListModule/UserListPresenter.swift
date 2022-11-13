//
//  UserListPresenter.swift
//  RandomUsersVIPER
//
//  Created by Alex Kovalyshyn on 12.11.2022.
//  
//

import UIKit
import SwiftUI
import Combine

final class UserListPresenter: UserListPresentable, UserListInteractableOutput {
    
    var router: UserListRoutable!
    var interactor: UserListInteractableInput!
    
    let objectWillChange = ObservableObjectPublisher()
    
    @Published var users: [User] = [] {
        willSet {
                self.objectWillChange.send()
        }
    }

    func viewDidLoad() {
        setupViewController()
        interactor.getUsers()
    }
    
    func viewDidAppear() {
        
    }
    
    func received(_ users: [User]) {
        DispatchQueue.main.async {
            self.users = users
        }
    }
    
    func setupViewController() {
        DispatchQueue.main.async {
            self.router.viewController?.navigationController?.navigationBar.prefersLargeTitles = true
            self.router.viewController?.title = "User List"
        }
    }
}


