//
//  ContentView.swift
//  FetchAssignment
//
//  Created by Joel Ferriera on 8/28/24.
//

import AppUI
import SwiftUI

struct MealDetailsView: View {
    @ObservedObject private var viewModel: MealDetailsViewModel
    private var id: String = ""
    
    private enum Constants {
        static let radius: CGFloat = 10
    }
    
    init(
        id: String,
        viewModel: MealDetailsViewModel
    ) {
        self.id = id
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(uiColor: .systemGray6)
                ScrollView {
                    VStack {
                        Text("Dessert Meals")
                            .font(.largeTitle)
                            .bold()

                        FetchImageView(url: viewModel.mealDetails?.strMealThumb)
                        
                        Text(viewModel.mealDetails?.strInstructions ?? "")
                        
                        ForEach (viewModel.mealDetails?.ingMeasure ?? []) { ingMeasure in
                            Text(ingMeasure.ingredient)
                            Text(ingMeasure.measurement)
                        }
                    }
                }
                .onAppear(
                    perform: {
                        viewModel.getMealDetails(id: id)
                    }
                )
            }
            .background(Color(uiColor: .systemGray6))
        }
    }
}

