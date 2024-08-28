//
//  File.swift
//  
//
//  Created by Joel Ferriera on 8/28/24.
//

import Foundation

public struct IngMeasure: Codable, Identifiable {
    public let id: String = UUID().uuidString
    public let ingredient: String
    public let measurement: String
    
    public init(ingredient: String, measurement: String) {
        self.ingredient = ingredient
        self.measurement = measurement
    }
}
