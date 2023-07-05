//
//  MealListViewModelTests.swift
//  Fetch - iOS Coding ChallengeTests
//
//  Created by Junaid Zaidi on 7/3/23.
//


import XCTest
@testable import Fetch___iOS_Coding_Challenge

class MealListViewModelTests: XCTestCase {
    
    var viewModel: MealListViewModel!
    var viewModelWithItems: MealListViewModel!
    
    var mealItem: MealsItem!

    override func setUp() {
        super.setUp()
        viewModel = MealListViewModel()
        
        mealItem = MealsItem(name: "Apam balik", image: "https:\\/\\/www.themealdb.com\\/images\\/media\\/meals\\/adxcbq1619787919.jpg", id: "53049")
        
        let meal = Meals(mealItems: [mealItem, mealItem])
        viewModelWithItems = MealListViewModel(meals: meal)
    }
    
    override func tearDown() {
        super.tearDown()
        viewModel = nil
        viewModelWithItems = nil
    }
    
    func testMealListEmpty() {
    
        XCTAssertNil(viewModel.items)
    }
    
    func testMealList() async {
        
        XCTAssertNotNil(viewModelWithItems.items)
        XCTAssertEqual(viewModelWithItems.items?.count, 2)
        XCTAssertEqual(viewModelWithItems.items?.first?.name, mealItem.name)
        XCTAssertEqual(viewModelWithItems.items?.first?.id, mealItem.id)
        XCTAssertEqual(viewModelWithItems.items?.first?.image, mealItem.image)
    }
    
}

