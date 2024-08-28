//
//  File.swift
//  
//
//  Created by Joel Ferriera on 8/28/24.
//

import Foundation

public struct Meal: Codable, Identifiable, Comparable {
    public let id: String
    public let strMeal: String
    public let strMealThumb: String
    
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case strMeal
        case strMealThumb
    }
    
    public static func < (lhs: Meal, rhs: Meal) -> Bool {
        lhs.strMeal < rhs.strMeal
    }
}
