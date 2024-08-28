//
//  File.swift
//
//
//  Created by Joel Ferriera on 8/28/24.
//

import Foundation

public struct MealDetails: Codable, Identifiable {
    public let id: String? = UUID().uuidString
    public let strMeal: String
    public let strInstructions: String
    public let strMealThumb: String
    public var ingMeasure: [IngMeasure]
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.strMeal = try container.decode(String.self, forKey: .strMeal)
        self.strInstructions = try container.decode(String.self, forKey: .strInstructions)
        self.strMealThumb = try container.decode(String.self, forKey: .strMealThumb)
        
        let heroContainer = try decoder.container(keyedBy: AnyKey.self)

        ingMeasure = []
        for i in 1...20 {
            let ingredient = try heroContainer.decodeIfPresent(String.self, forKey: .key(named: "strIngredient\(i)"))
            let measure = try heroContainer.decodeIfPresent(String.self, forKey: .key(named: "strMeasure\(i)"))
            
            ingMeasure.append(.init(ingredient: ingredient ?? ""
                                    , measurement: measure ?? ""))
        }
    }
    
    struct AnyKey: CodingKey {
        enum Errors: Error {
            case invalid
        }

        var stringValue: String
        var intValue: Int?

        init?(stringValue: String) {
            self.stringValue = stringValue
            self.intValue = Int(stringValue)
        }

        init?(intValue: Int) {
            self.intValue = intValue
            stringValue = "\(intValue)"
        }

        static func key(named name: String) throws -> Self {
            guard let key = Self(stringValue: name) else {
                throw Errors.invalid
            }
            return key
        }
    }
    
    public init(
        strMeal: String,
        strInstructions: String,
        strMealThumb: String,
        ingMeasure: [IngMeasure]
    ) {
        self.strMeal = strMeal
        self.strInstructions = strInstructions
        self.strMealThumb = strMealThumb
        self.ingMeasure = ingMeasure
    }
}
