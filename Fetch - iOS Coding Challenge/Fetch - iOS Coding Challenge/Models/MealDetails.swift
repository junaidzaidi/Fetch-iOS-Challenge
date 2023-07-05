//
//  MealDetails.swift
//  Fetch - iOS Coding Challenge
//
//  Created by Junaid Zaidi on 7/3/23.
//

import Foundation
struct MealDetails: Codable {
 
    let mealDetail : [MealDetailsItem]?
    
    enum CodingKeys: String, CodingKey {
        case mealDetail = "meals"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        mealDetail = try values.decodeIfPresent([MealDetailsItem].self, forKey: .mealDetail)
    }
}
