//
//  RandomUserError.swift
//  RandomUsersVIPER
//
//  Created by Alex Kovalyshyn on 12.11.2022.
//

import Foundation

enum RandomUserError: Error {
    case generic(description: String)
}

extension RandomUserError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .generic(description: let description):
            return NSLocalizedString(description, comment: description)
        }
    }
}
