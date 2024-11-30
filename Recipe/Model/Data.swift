//
//  Data.swift
//  Recipe
//
//  Created by IS 543 on 11/29/24.
//

import SwiftData
import Foundation

struct Data {
    static var theCategories: [Category] = [
        Category(name: "All"),
        Category(name: "Appetizer"),
        Category(name: "Breakfast"),
        Category(name: "Dessert"),
        Category(name: "Lunch"),
        Category(name: "Snacks"),
        Category(name: "Dinner")
    ]
    
    static var theRecipes: [Recipe] = {
        var recipes = [
            Recipe(name: "Oatmeal Chocolate Chip and M&M Cookies",
                   instructions: "Cook them",
                   ingredients: """
                                    - 3 C Flour
                                    - 1 C M&Ms
                                    - 1 C Oats
                                """,
                   categories: [theCategories[0], theCategories[3]], // Use "All" and "Dessert"
                   servings: 10,
                   time: 60,
                   author: "Melanie Winder",
                   dateAdded: ISO8601DateFormatter().date(from: "2024-11-25T00:00:00Z") ?? Date(),
                   favorite: true,
                   notes: "These are the best cookies for a crowd because they are good for kids")
        ]
        
        // Add recipes to their corresponding categories
        recipes.forEach { recipe in
            recipe.categories.forEach { category in
                category.recipes.append(recipe)
            }
        }
        
        return recipes
    }()
}
