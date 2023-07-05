//
//  Meals.swift
//  Fetch - iOS Coding Challenge
//
//  Created by Junaid Zaidi on 7/3/23.
//

import Foundation

struct Meals: Codable {
 
    let mealItems : [MealsItem]?
    
    enum CodingKeys: String, CodingKey {
        case mealItems = "meals"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        mealItems = try values.decodeIfPresent([MealsItem].self, forKey: .mealItems)
    }
    
    init(mealItems: [MealsItem]) {
        self.mealItems = mealItems
    }
}
