//
//  XCTest+JSON.swift
//  RandomUsersVIPERTests
//
//  Created by Alex Kovalyshyn on 13.11.2022.
//

import XCTest

extension XCTestCase {
    func getData(fromJSON fileName: String) throws -> Data {
        let bundle = Bundle(for: type(of: self))
        guard let url = bundle.url(forResource: fileName, withExtension: "json") else {
            XCTFail("Missing File: \(fileName).json")
            throw TestError.fileNotFound
        }
        do {
            let data = try Data(contentsOf: url)
            return data
        } catch {
            throw error
        }
    }
}
