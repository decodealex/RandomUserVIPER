//
//  Endpoint.swift
//  RandomUsersVIPER
//
//  Created by Alex Kovalyshyn on 12.11.2022.
//

import Foundation

/// Enum used to define which HTTP method an endpoint will be using
public enum HTTPMethod {
    case delete, get, post, put
}

/// Enum used to define which HTTP scheme an endpoint will be using
public enum HTTPScheme: String {
    case http
    case https
}

public protocol Endpoint {
    /// The HTTP scheme for this endpoint (e.g. "https")
    var scheme: HTTPScheme { get }
    
    /// The base url for this endpoint (e.g. "randomuser.me")
    var baseURL: String { get }
    
    /// The path for this endpoint (e.g. "/users")
    var path: String? { get }
    
    /// The HTTP method for the endpoint (e.g. "GET")
    var method: HTTPMethod { get }
    
    var headers: [String: String]? { get }
    
    var parameters: [String: String]? { get }
    
    /// Build the relevant URL request from the values specified in the  endpoint
    func buildURLRequest() throws -> URLRequest
    
    func buildURL() throws -> URL
    
}

public extension Endpoint {
    
    var headers: [String: String]? { nil }
    var parameters: [String: String]? { nil }
    var scheme: HTTPScheme { .https }
    var path: String? { nil }
    var baseURL: String { "randomuser.me/api" }

    func buildURL() throws -> URL {
        var components = URLComponents()
        components.scheme = scheme.rawValue
        components.host = baseURL
        if let path = path { components.path = path }
        if let parameters = parameters {
            components.queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value) }
        }
        
        guard let url = components.url else {
            throw NetworkError.badURL
            
        }
        
        return url
    }
    
    func buildURLRequest() throws -> URLRequest {
        let url = try buildURL()
        var request = URLRequest(url: url)
        
        if let headers = headers {
            headers.forEach { request.addValue($0.value, forHTTPHeaderField: $0.key) }
        }
        return request
    }
    
}

