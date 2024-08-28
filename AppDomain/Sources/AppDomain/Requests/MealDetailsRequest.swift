//
//  File.swift
//
//
//  Created by Joel Ferriera on 8/21/24.
//

import Foundation

public enum MealDetailsRequest {
    case get(id: String)
}

extension MealDetailsRequest: RequestProtocol {
    public var method: HTTPMethod { .get }
    public var path: String { "https://themealdb.com/api/json/v1/1/lookup.php" }
    public var parameters: [String: String] {
        switch self {
        case let .get(id):
            return ["i": id]
            
        default:
            return [:]
        }
    }
}
