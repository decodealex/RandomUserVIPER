//
//  NetworkService.swift
//  RandomUsersVIPER
//
//  Created by Alex Kovalyshyn on 12.11.2022.
//

import Foundation

public protocol NetworkServiceProtocol {
    func request(urlSession: URLSession, endpoint: Endpoint) async throws -> Data
}

public class NetworkService {
    
    private var accessToken: String?
    static public let shared = NetworkService()
    
    private func handleResponse(_ data: Data, response: URLResponse) throws {
        if let response = response as? HTTPURLResponse, !(200..<300).contains(response.statusCode) {
            let error = try? JSONDecoder.defaultDecoder.decode(ErrorResponseModel.self, from: data)
            throw NetworkError.generic(description: error?.error ?? "Unexpected error happened")
        }
    }
}

extension NetworkService: NetworkServiceProtocol {
    
    public func request(urlSession: URLSession, endpoint: Endpoint) async throws -> Data {
        let request = try endpoint.buildURLRequest()

        let (data, response) = try await urlSession.data(for: request)
        try handleResponse(data, response: response)

        return data
    }
}

