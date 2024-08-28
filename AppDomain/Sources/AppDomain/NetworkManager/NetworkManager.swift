//
//  File.swift
//  
//
//  Created by Joel Ferriera on 8/21/24.
//

import Foundation

public protocol NetworkManager {
    func request<Element: Codable>(_ request: RequestProtocol) async throws -> Element
}

public enum FetchError: Error {
    case invalidURL
    case invalidResponse
    case unkownError
}
