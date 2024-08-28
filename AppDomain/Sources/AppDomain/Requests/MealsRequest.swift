//
//  File.swift
//  
//
//  Created by Joel Ferriera on 8/21/24.
//

import Foundation

public enum MealsRequest {
    case get
}

extension MealsRequest: RequestProtocol {
    public var method: HTTPMethod { .get }
    public var path: String { "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert" }
    public var parameters: [String : String] { [:] }
}
