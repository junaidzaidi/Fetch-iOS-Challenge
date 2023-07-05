//
//  RecipeListViewModel.swift
//  Fetch - iOS Coding Challenge
//
//  Created by Junaid Zaidi on 7/3/23.
//

import Foundation
class MealListViewModel {
    
    private(set) var meals: Meals? = nil
    private let networkingManager: NetworkingManager
    
    var items: [MealsItem]? {
//        return []
        return meals?.mealItems
    }
    
    
    init(meals: Meals? = nil, networkingManager: NetworkingManager = NetworkingManager.shared) {
        self.meals = meals
        self.networkingManager = networkingManager
    }
    
    func fetchDessertMealsAsync() async throws {
        let data = try await networkingManager.getRequest(withEndpoint: "\(Environments.baseURL.rawValue)\(APIEndpoints.dessertList.rawValue)")
        do {
            self.meals = try JSONDecoder().decode(Meals.self, from: data)
        }
        catch {
            throw Errors.decodingError
        }
        
    }
}

