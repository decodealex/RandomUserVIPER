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

class UserDetailsRouter: NSObject, UserDetailsRoutable {
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
    
    func presentEmailComposeView(for email: String) throws {
        if MFMailComposeViewController.canSendMail() {
               let mail = MFMailComposeViewController()
               mail.mailComposeDelegate = self
               mail.setToRecipients([email])
               mail.setMessageBody("<p>You're so awesome!</p>", isHTML: true)

            viewController?.present(mail, animated: true)
           } else {
               throw RandomUserError.generic(description: "Can't send email")
           }
    }
    
    func displayAlertWith(_ title: String, _ message: String, buttonTitle: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: buttonTitle, style: .default)
        
        alert.addAction(action)
        viewController?.present(alert, animated: true)
    }
}

extension UserDetailsRouter: MFMailComposeViewControllerDelegate {
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        viewController?.dismiss(animated: true)
    }
}
