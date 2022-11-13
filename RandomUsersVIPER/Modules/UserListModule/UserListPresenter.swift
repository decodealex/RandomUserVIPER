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
    
    @Published var data: [UserListData] = [] {
        willSet {
            self.objectWillChange.send()
        }
    }

    func viewDidLoad() {
        
    }
    
    func viewDidAppear() {
        
    }
}


