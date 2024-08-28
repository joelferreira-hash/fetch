//
//  ContentViewModel.swift
//  FetchAssignment
//
//  Created by Joel Ferriera on 8/28/24.
//

import AppDomain
import Foundation

@MainActor
final class MealDetailsViewModel: ObservableObject {
    @Published var mealDetails: MealDetails?
    private var networkManager: NetworkManager

    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }

    func getMealDetails(id: String) {
        Task {
            do {
                guard let fetchedMeals: MealsDetails = try await networkManager.request(MealDetailsRequest.get(id: id)) else { throw FetchError.invalidURL }
                self.mealDetails = fetchedMeals.meals.first
            } catch let error {
                print("Error getMealDetails: \(error)")
            }
        }
    }
}
