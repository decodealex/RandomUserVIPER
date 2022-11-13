//
//  JSONDecoder.swift
//  RandomUsersVIPER
//
//  Created by Alex Kovalyshyn on 13.11.2022.
//

import Foundation

extension JSONDecoder {
    static let defaultDecoder: JSONDecoder = {
        let decoder = JSONDecoder()

        return decoder
    }()
}
