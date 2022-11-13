//
//  UserDetailsPresenter.swift
//  RandomUsersVIPER
//
//  Created by Alex Kovalyshyn on 12.11.2022.
//  
//

import UIKit
import SwiftUI
import Combine

final class UserDetailsPresenter: UserDetailsPresentable, UserDetailsInteractableOutput {
    
    var router: UserDetailsRoutable!
    var interactor: UserDetailsInteractableInput!
    
    let objectWillChange = ObservableObjectPublisher()
    
    @Published var user: User? = nil {
        willSet {
            self.objectWillChange.send()
        }
    }
    
    @Published var rows: [UserDetailRowModel] = [] {
        willSet {
            self.objectWillChange.send()
        }
    }

    func viewDidLoad() {
        interactor.getUser()
        interactor.getRows()
    }
    
    func viewDidAppear() {
        
    }
    
    func receivedUser(_ user: User) {
        self.user = user
    }
    
    func receivedRows(_ rows: [UserDetailRowModel]) {
        self.rows = rows
    }
    
    func tappedEmail() {
        
    }
    
}


