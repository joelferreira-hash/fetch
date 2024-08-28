//
//  SwiftUIView.swift
//
//
//  Created by Joel Ferriera on 8/21/24.
//

import AppDomain
import SwiftUI

public struct MealView: View {
    var meal: Meal?
    
    public var body: some View {
        VStack {
            FetchImageView(url: meal?.strMealThumb ?? "")
                .roundedCorner(cornerRadius: 15, borderWidth: 0)
                .padding()
            Text(meal?.strMeal ?? "")
                .font(.headline)
                .padding()
        }
        .frame(maxWidth: .infinity)
        .background(Color(uiColor: .white))
        .roundedCorner(cornerRadius: 15, borderWidth: 0)
        .padding()
    }
    
    public init(meal: Meal?) {
        self.meal = meal
    }
}
