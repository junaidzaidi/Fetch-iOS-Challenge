//
//  Meals.swift
//  Fetch - iOS Coding Challenge
//
//  Created by Junaid Zaidi on 7/3/23.
//

import Foundation

struct MealsItem: Codable {
    let name : String?
    let image : String?
    let id : String?
    
    

    enum CodingKeys: String, CodingKey {

        case name = "strMeal"
        case image = "strMealThumb"
        case id = "idMeal"
    }

    init(from decoder: Decoder) throws {

        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        image = try values.decodeIfPresent(String.self, forKey: .image)
        id = try values.decodeIfPresent(String.self, forKey: .id)
    }
    
    init(name: String?, image: String?, id: String) {
        self.name = name
        self.image = image
        self.id = id
    }

}
