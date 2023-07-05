//
//  MealDetailsItem.swift
//  Fetch - iOS Coding Challenge
//
//  Created by Junaid Zaidi on 7/3/23.
//

import Foundation
class MealDetailsItem : NSObject, Codable {
    let id : String?
    let name : String?
    let drinkAlternate : String?
    let category : String?
    let area : String?
    let instructions : String?
    let image : String?
    let tags : String?
    let youtube : String?
    @objc let ingredient1 : String?
    @objc let ingredient2 : String?
    @objc let ingredient3 : String?
    @objc let ingredient4 : String?
    @objc let ingredient5 : String?
    @objc let ingredient6 : String?
    @objc let ingredient7 : String?
    @objc let ingredient8 : String?
    @objc let ingredient9 : String?
    @objc let ingredient10 : String?
    @objc let ingredient11 : String?
    @objc let ingredient12 : String?
    @objc let ingredient13 : String?
    @objc let ingredient14 : String?
    @objc let ingredient15 : String?
    @objc let ingredient16 : String?
    @objc let ingredient17 : String?
    @objc let ingredient18 : String?
    @objc let ingredient19 : String?
    @objc let ingredient20 : String?
    @objc let measure1 : String?
    @objc let measure2 : String?
    @objc let measure3 : String?
    @objc let measure4 : String?
    @objc let measure5 : String?
    @objc let measure6 : String?
    @objc let measure7 : String?
    @objc let measure8 : String?
    @objc let measure9 : String?
    @objc let measure10 : String?
    @objc let measure11 : String?
    @objc let measure12 : String?
    @objc let measure13 : String?
    @objc let measure14 : String?
    @objc let measure15 : String?
    @objc let measure16 : String?
    @objc let measure17 : String?
    @objc let measure18 : String?
    @objc let measure19 : String?
    @objc let measure20 : String?
    let source : String?
    let imageSource : String?
    let creativeCommonsConfirmed : String?
    let dateModified : String?

    enum CodingKeys: String, CodingKey {

        case id = "idMeal"
        case name = "strMeal"
        case drinkAlternate = "strDrinkAlternate"
        case category = "strCategory"
        case area = "strArea"
        case instructions = "strInstructions"
        case image = "strMealThumb"
        case tags = "strTags"
        case youtube = "strYoutube"
        case ingredient1 = "strIngredient1"
        case ingredient2 = "strIngredient2"
        case ingredient3 = "strIngredient3"
        case ingredient4 = "strIngredient4"
        case ingredient5 = "strIngredient5"
        case ingredient6 = "strIngredient6"
        case ingredient7 = "strIngredient7"
        case ingredient8 = "strIngredient8"
        case ingredient9 = "strIngredient9"
        case ingredient10 = "strIngredient10"
        case ingredient11 = "strIngredient11"
        case ingredient12 = "strIngredient12"
        case ingredient13 = "strIngredient13"
        case ingredient14 = "strIngredient14"
        case ingredient15 = "strIngredient15"
        case ingredient16 = "strIngredient16"
        case ingredient17 = "strIngredient17"
        case ingredient18 = "strIngredient18"
        case ingredient19 = "strIngredient19"
        case ingredient20 = "strIngredient20"
        case measure1 = "strMeasure1"
        case measure2 = "strMeasure2"
        case measure3 = "strMeasure3"
        case measure4 = "strMeasure4"
        case measure5 = "strMeasure5"
        case measure6 = "strMeasure6"
        case measure7 = "strMeasure7"
        case measure8 = "strMeasure8"
        case measure9 = "strMeasure9"
        case measure10 = "strMeasure10"
        case measure11 = "strMeasure11"
        case measure12 = "strMeasure12"
        case measure13 = "strMeasure13"
        case measure14 = "strMeasure14"
        case measure15 = "strMeasure15"
        case measure16 = "strMeasure16"
        case measure17 = "strMeasure17"
        case measure18 = "strMeasure18"
        case measure19 = "strMeasure19"
        case measure20 = "strMeasure20"
        case source = "strSource"
        case imageSource = "strImageSource"
        case creativeCommonsConfirmed = "strCreativeCommonsConfirmed"
        case dateModified = "dateModified"
    }

    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        drinkAlternate = try values.decodeIfPresent(String.self, forKey: .drinkAlternate)
        category = try values.decodeIfPresent(String.self, forKey: .category)
        area = try values.decodeIfPresent(String.self, forKey: .area)
        instructions = try values.decodeIfPresent(String.self, forKey: .instructions)
        image = try values.decodeIfPresent(String.self, forKey: .image)
        tags = try values.decodeIfPresent(String.self, forKey: .tags)
        youtube = try values.decodeIfPresent(String.self, forKey: .youtube)
        ingredient1 = try values.decodeIfPresent(String.self, forKey: .ingredient1)
        ingredient2 = try values.decodeIfPresent(String.self, forKey: .ingredient2)
        ingredient3 = try values.decodeIfPresent(String.self, forKey: .ingredient3)
        ingredient4 = try values.decodeIfPresent(String.self, forKey: .ingredient4)
        ingredient5 = try values.decodeIfPresent(String.self, forKey: .ingredient5)
        ingredient6 = try values.decodeIfPresent(String.self, forKey: .ingredient6)
        ingredient7 = try values.decodeIfPresent(String.self, forKey: .ingredient7)
        ingredient8 = try values.decodeIfPresent(String.self, forKey: .ingredient8)
        ingredient9 = try values.decodeIfPresent(String.self, forKey: .ingredient9)
        ingredient10 = try values.decodeIfPresent(String.self, forKey: .ingredient10)
        ingredient11 = try values.decodeIfPresent(String.self, forKey: .ingredient11)
        ingredient12 = try values.decodeIfPresent(String.self, forKey: .ingredient12)
        ingredient13 = try values.decodeIfPresent(String.self, forKey: .ingredient13)
        ingredient14 = try values.decodeIfPresent(String.self, forKey: .ingredient14)
        ingredient15 = try values.decodeIfPresent(String.self, forKey: .ingredient15)
        ingredient16 = try values.decodeIfPresent(String.self, forKey: .ingredient16)
        ingredient17 = try values.decodeIfPresent(String.self, forKey: .ingredient17)
        ingredient18 = try values.decodeIfPresent(String.self, forKey: .ingredient18)
        ingredient19 = try values.decodeIfPresent(String.self, forKey: .ingredient19)
        ingredient20 = try values.decodeIfPresent(String.self, forKey: .ingredient20)
        measure1 = try values.decodeIfPresent(String.self, forKey: .measure1)
        measure2 = try values.decodeIfPresent(String.self, forKey: .measure2)
        measure3 = try values.decodeIfPresent(String.self, forKey: .measure3)
        measure4 = try values.decodeIfPresent(String.self, forKey: .measure4)
        measure5 = try values.decodeIfPresent(String.self, forKey: .measure5)
        measure6 = try values.decodeIfPresent(String.self, forKey: .measure6)
        measure7 = try values.decodeIfPresent(String.self, forKey: .measure7)
        measure8 = try values.decodeIfPresent(String.self, forKey: .measure8)
        measure9 = try values.decodeIfPresent(String.self, forKey: .measure9)
        measure10 = try values.decodeIfPresent(String.self, forKey: .measure10)
        measure11 = try values.decodeIfPresent(String.self, forKey: .measure11)
        measure12 = try values.decodeIfPresent(String.self, forKey: .measure12)
        measure13 = try values.decodeIfPresent(String.self, forKey: .measure13)
        measure14 = try values.decodeIfPresent(String.self, forKey: .measure14)
        measure15 = try values.decodeIfPresent(String.self, forKey: .measure15)
        measure16 = try values.decodeIfPresent(String.self, forKey: .measure16)
        measure17 = try values.decodeIfPresent(String.self, forKey: .measure17)
        measure18 = try values.decodeIfPresent(String.self, forKey: .measure18)
        measure19 = try values.decodeIfPresent(String.self, forKey: .measure19)
        measure20 = try values.decodeIfPresent(String.self, forKey: .measure20)
        source = try values.decodeIfPresent(String.self, forKey: .source)
        imageSource = try values.decodeIfPresent(String.self, forKey: .imageSource)
        creativeCommonsConfirmed = try values.decodeIfPresent(String.self, forKey: .creativeCommonsConfirmed)
        dateModified = try values.decodeIfPresent(String.self, forKey: .dateModified)
    }
}

