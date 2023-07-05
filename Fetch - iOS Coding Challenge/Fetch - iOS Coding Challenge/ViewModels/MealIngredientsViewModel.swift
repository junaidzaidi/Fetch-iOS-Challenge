//
//  RecipieIngredientsViewModel.swift
//  Fetch - iOS Coding Challenge
//
//  Created by Junaid Zaidi on 7/3/23.
//

import Foundation

class MealIngredientsViewModel {
    
    private(set) var mealDetails: MealDetailsItem?
    private let networkingManager: NetworkingManager
    
    let mealId: String
    let name: String
    
    
    init(mealDetails: MealDetailsItem? = nil, mealId: String, name: String, networkingManager: NetworkingManager = NetworkingManager.shared) {
        self.mealDetails = mealDetails
        self.mealId = mealId
        self.name = name
        self.networkingManager = networkingManager
    }
    
    var ingredients: String? {
        
        var ingredients: [String] = []
        
        for i in 1...20 {
            
            let ingredientKey = "ingredient\(i)"
            let measureKey = "measure\(i)"
            if let ingredient = mealDetails?.value(forKey: ingredientKey) as? String,
               let measure = mealDetails?.value(forKey: measureKey) as? String,
               !ingredient.isEmpty,
               !measure.isEmpty {
                let ingredientLine = "\(ingredient): \(measure)"
                ingredients.append(ingredientLine)
            }
        }

        let formattedIngredients = ingredients.joined(separator: "\n")

        return formattedIngredients
    }
    
    
    
    func fetchMealDetails() async throws {
        
        let data = try await networkingManager.getRequest(withEndpoint: "\(Environments.baseURL.rawValue)\(APIEndpoints.mealDetails.rawValue)\(mealId)")
        do {
            let mealDetails = try JSONDecoder().decode(MealDetails.self, from: data)
            self.mealDetails = mealDetails.mealDetail?.first
        }
        catch {
            throw Errors.decodingError
        }
          
    }
}

