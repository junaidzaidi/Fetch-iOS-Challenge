//
//  AppStrings.swift
//  Fetch - iOS Coding Challenge
//
//  Created by Junaid Zaidi on 7/3/23.
//

import Foundation

enum Environments: String {
    case baseURL = "https://themealdb.com/api/json/v1/1"
}

enum APIEndpoints: String {
    case dessertList = "/filter.php?c=Dessert"
    case mealDetails = "/lookup.php?i="
}

enum Headings : String {
    case ingredients = "Ingredients"
    case instructions = "Instructions"
    case category = "Category"
    case area = "Area"
    case drinkAlternate = "Drink Alternate"
    case tags = "Tags"
    case source = "Source"
    case youtube = "Youtube"
    case dessertRecipes = "Dessert Recipes"
    
}

enum ErrorStrings: String {
    case coderNotImplemented = "init(coder:) has not been implemented"
    case errorMealList = "Unable to Fetch Meals. Tap to reload"
}

enum Assets: String {
    case noPlaceholder = "NoImagePlaceholder"
}

enum ReusableIdentifiers: String {
    case mealCollectionViewCell = "mealCollectionViewCell"
    case emptyCollectionViewCell = "emptyCollectionViewCell"
}

enum General: String {
    case inlineYoutube = "?playsinline=1"
}
