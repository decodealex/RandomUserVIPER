//
//  UserListInteractor.swift
//  RandomUsersVIPER
//
//  Created by Alex Kovalyshyn on 12.11.2022.
//  
//

import Foundation

class UserListInteractor: UserListInteractableInput {
    weak var output: UserListInteractableOutput!
    private var userRepository: UserRepositoryProtocol
    
    var users: [User] = []
    
    init(userRepository: UserRepositoryProtocol) {
        self.userRepository = userRepository
    }

    func getUsers() {
        Task {
            do {
                users = try await userRepository.getUserList(of: 40)
                output.received(users)
                print("❗️DEBUG: \(users) ")
            } catch {
                //TO DO notify user about error
                print("❗️DEBUG: \(error.localizedDescription) ")
            }
        }
    }
}
