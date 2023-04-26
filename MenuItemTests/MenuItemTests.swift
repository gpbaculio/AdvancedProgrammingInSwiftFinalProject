//
//  MenuItemTests.swift
//  MenuItemTests
//
//  Created by Glendon Philipp Baculio on 4/27/23.
//

import XCTest
@testable import AdvancedProgrammingInSwiftFinal

final class MenuItemTests: XCTestCase {

    func testMenuItemTitle() {
        let title = "Spaghetti Carbonara"
        let menuItem = MenuItem(
            title: title,
            image: "https://www.themealdb.com/images/media/meals/3xn7th1560453426.jpg",
            menuCategory: .food,
            ordersCount: 50,
            price: 8.99,
            ingredients: [.spinach, .broccoli]
        )
        
        // Act
        let menuItemTitle = menuItem.title
        
        // Assert
        XCTAssertEqual(menuItemTitle, title, "Expect the menu item title to equal the initialized value")
    }
    
    func testMenuItemTitleInitializedWithIngredients() {
        let title = "Spaghetti Carbonara"
        let ingredients: [Ingredient] = [.spinach, .broccoli]
        let menuItem = MenuItem(
            title: title,
            image: "https://www.themealdb.com/images/media/meals/3xn7th1560453426.jpg",
            menuCategory: .food,
            ordersCount: 50,
            price: 8.99,
            ingredients: ingredients
        )
        
        // Act
        let menuItemTitle = menuItem.title
        
        // Assert
        XCTAssertEqual(menuItemTitle, title, "Expect the menu item title to equal the initialized value")
        XCTAssertEqual(ingredients.count, menuItem.ingredients.count, "Same length with initialized value")
           
        for (element1, element2) in zip(ingredients, menuItem.ingredients) {
            XCTAssertEqual(element1, element2)
        }
    }

}
