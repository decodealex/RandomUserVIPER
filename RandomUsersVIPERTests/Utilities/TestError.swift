//
//  TestError.swift
//  RandomUsersVIPERTests
//
//  Created by Alex Kovalyshyn on 13.11.2022.
//

import Foundation

enum TestError: Error {
    case fileNotFound
    case generic(description: String)
}
