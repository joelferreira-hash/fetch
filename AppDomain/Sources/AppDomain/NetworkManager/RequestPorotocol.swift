//
//  RequestPorotocol.swift
//
//
//  Created by Joel Ferriera on 8/21/24.
//

import Foundation

public enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}

public protocol RequestProtocol {
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: [String: String] { get }
}

public extension RequestProtocol {
    func urlRequest() throws -> URLRequest {
        guard var urlComponents = URLComponents(string: path) else { throw FetchError.invalidURL }
        
        if !parameters.isEmpty {
            urlComponents.queryItems = []
            parameters.forEach { (key, value) in
                urlComponents.queryItems?.append(URLQueryItem(name: key, value: value))
            }
        }
        
        guard let url = urlComponents.url else { throw FetchError.invalidURL }
        var urlRequest: URLRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        return urlRequest
    }
}
