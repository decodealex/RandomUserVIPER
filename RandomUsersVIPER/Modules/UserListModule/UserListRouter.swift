//
//  UserListRouter.swift
//  RandomUsersVIPER
//
//  Created by Alex Kovalyshyn on 12.11.2022.
//  
//

import UIKit
import SwiftUI

class UserListRouter: UserListRoutable {
    weak var viewController: UIViewController?

    static func buildModule() -> UIViewController {
        let userRepository = UserRepository()
        
        let presenter = UserListPresenter()
        let router = UserListRouter()
        let interactor = UserListInteractor(userRepository: userRepository)
        
        let view = UserListView(presenter: presenter)

        presenter.router = router
        presenter.interactor = interactor
        
        let viewController = UIHostingController(rootView: view)
        router.viewController = viewController
        
        interactor.output = presenter
        
        // Load data for the view
        presenter.viewDidLoad()
        
        return viewController
    }

    static func buildModuleView() -> some View {
        let userRepository = UserRepository()
        
        let presenter = UserListPresenter()
        let router = UserListRouter()
        let interactor = UserListInteractor(userRepository: userRepository)
        
        let view = UserListView(presenter: presenter)

        presenter.router = router
        presenter.interactor = interactor
        
        interactor.output = presenter
        
        // Load data for the view
        presenter.viewDidLoad()
        
        return view
    }
    
}
