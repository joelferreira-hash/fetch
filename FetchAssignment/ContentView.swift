//
//  ContentView.swift
//  FetchAssignment
//
//  Created by Joel Ferriera on 8/28/24.
//

import AppDomain
import AppUI
import SwiftUI

struct ContentView: View {
    @ObservedObject private var viewModel: ContentViewModel
    
    private enum Constants {
        static let radius: CGFloat = 10
    }
    
    init(viewModel: ContentViewModel) {
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

                        ForEach(viewModel.meals) { item in
                            NavigationLink(destination: MealDetailsView(id: item.id, viewModel: .init(networkManager: DefaultNetworkManager()))) {
                                MealView(meal: item)
                            }
                        }
                    }
                }
                .onAppear(
                    perform: {
                        viewModel.getMeals()
                    }
                )
            }
            .background(Color(uiColor: .systemGray6))
        }
    }
}

