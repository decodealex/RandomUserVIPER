//
//  UserDetailsRouter.swift
//  RandomUsersVIPER
//
//  Created by Alex Kovalyshyn on 12.11.2022.
//  
//

import UIKit
import SwiftUI
import MessageUI

class UserDetailsRouter: UserDetailsRoutable {
    weak var viewController: UIViewController?

    static func buildModule(for user: User) -> UIViewController {
        let presenter = UserDetailsPresenter()
        let router = UserDetailsRouter()
        let interactor = UserDetailsInteractor(for: user)
        
        let view = UserDetailsView(presenter: presenter)

        presenter.router = router
        presenter.interactor = interactor
        
        let viewController = UIHostingController(rootView: view)
        router.viewController = viewController
        
        interactor.output = presenter
        
        // Load data for the view
        presenter.viewDidLoad()
        
        return viewController
    }

    static func buildModuleView(for user: User) -> some View {
        let presenter = UserDetailsPresenter()
        let router = UserDetailsRouter()
        let interactor = UserDetailsInteractor(for: user)
        
        let view = UserDetailsView(presenter: presenter)

        presenter.router = router
        presenter.interactor = interactor
        
        interactor.output = presenter
        
        // Load data for the view
        presenter.viewDidLoad()
        
        return view
    }
    
//    func presentEmailComposeView(for email: String) throws {
//        if MFMailComposeViewController.canSendMail() {
//               let mail = MFMailComposeViewController()
//               mail.mailComposeDelegate = self
//               mail.setToRecipients(["you@yoursite.com"])
//               mail.setMessageBody("<p>You're so awesome!</p>", isHTML: true)
//
//               present(mail, animated: true)
//           } else {
//               // show failure alert
//           }
//    }
}

