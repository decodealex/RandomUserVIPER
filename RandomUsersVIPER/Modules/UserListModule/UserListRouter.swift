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
    
    func presentUserDetailsSheet(for user: User) {
        viewController?.dismiss(animated: true)
        
        let destinationVC = UserDetailsRouter.buildModule(for: user)
        if let sheet = destinationVC.sheetPresentationController {
             sheet.detents = [.medium(), .large()]
             sheet.largestUndimmedDetentIdentifier = .medium
             sheet.prefersScrollingExpandsWhenScrolledToEdge = false
             sheet.prefersEdgeAttachedInCompactHeight = true
             sheet.widthFollowsPreferredContentSizeWhenEdgeAttached = true
            sheet.prefersGrabberVisible = true
         }
        viewController?.present(destinationVC, animated: true, completion: nil)
    }
    
}
