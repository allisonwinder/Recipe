//
//  Data.swift
//  Recipe
//
//  Created by IS 543 on 11/29/24.
//

import SwiftData
import Foundation

func Data(context: ModelContext) {
        let allCategory = Category(name: "All")
        let appCategory = Category(name: "Appetizer")
        let breakCategory = Category(name: "Breakfast")
        let dessCategory = Category(name: "Dessert")
        let lunchCategory = Category(name: "Lunch")
        let snackCategory = Category(name: "Snacks")
        let dinCategory = Category(name: "Dinner")
    
        let cookieRecipe =
            Recipe(name: "Oatmeal Chocolate Chip and M&M Cookies",
                   instructions: "Cook them",
                   ingredients: """
                                    - 3 C Flour
                                    - 1 C M&Ms
                                    - 1 C Oats
                                """,
                   categories: [allCategory, dessCategory],
                   servings: 10,
                   time: 60,
                   author: "Melanie Winder",
                   dateAdded: ISO8601DateFormatter().date(from: "2024-11-25T00:00:00Z") ?? Date(),
                   favorite: true,
                   notes: "These are the best cookies for a crowd because they are good for kids")
        
    // Save the data to the context
    context.insert(allCategory)
    context.insert(appCategory)
    context.insert(breakCategory)
    context.insert(dessCategory)
    context.insert(lunchCategory)
    context.insert(snackCategory)
    context.insert(dinCategory)
    
    allCategory.recipes.append(cookieRecipe)
    dessCategory.recipes.append(cookieRecipe)
    
    context.insert(cookieRecipe)
    
    do {
        try context.save()
        print("Recipe and category relationship saved successfully!")
    } catch {
        print("Error saving data: \(error)")
    }
    
    //try? context.save()
}
