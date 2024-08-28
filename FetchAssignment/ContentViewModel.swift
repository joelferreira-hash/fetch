//
//  ContentViewModel.swift
//  FetchAssignment
//
//  Created by Joel Ferriera on 8/28/24.
//

import AppDomain
import Foundation

@MainActor
final class ContentViewModel: ObservableObject {
    @Published var meals: [Meal] = []
    private var networkManager: NetworkManager

    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }

    func getMeals() {
        guard meals.isEmpty else { return }

        Task {
            do {
                let fetchedMeals: Meals = try await networkManager.request(MealsRequest.get)
                self.meals = fetchedMeals.meals.sorted()
            } catch let error {
                print("Error getMeals: \(error)")
            }
        }
    }
}
