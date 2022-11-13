//
//  UserEndpoint.swift
//  RandomUsersVIPER
//
//  Created by Alex Kovalyshyn on 12.11.2022.
//

import Foundation

public enum UserEndpoint: Endpoint {
    case getUserList(count: Int)
    
    public var baseURL: String { "randomuser.me" }
    public var path: String? { return "/api" }
    public var method: HTTPMethod {
        switch self {
        case .getUserList: return .get
        }
    }
    
    public var parameters: [String : String]? {
        switch self {
        case .getUserList(count: let count):
            return ["results": String(count)]
        }
    }
    
}
