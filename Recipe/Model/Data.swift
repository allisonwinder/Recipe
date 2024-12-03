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
        let breadCategory = Category(name: "Bread")
        let snackCategory = Category(name: "Snacks")
        let dinCategory = Category(name: "Dinner")
    
    let cookieRecipe = Recipe(
        name: "Oatmeal Chocolate Chip and M&M Cookies",
        instructions: """
            Preheat oven to 375°F. In a large bowl, cream together the butter, sugars, and vanilla until light and fluffy. 
            Beat in the eggs one at a time. In another bowl, combine the flour, baking soda, and salt; gradually add to the creamed mixture. 
            Stir in the oats, chocolate chips, and M&Ms. Drop by rounded spoonfuls onto an ungreased baking sheet. 
            Bake for 9-12 minutes or until golden brown. Allow to cool on baking sheet for 2 minutes, then transfer to wire racks to cool completely.
        """,
        ingredients: """
            - 1 cup butter flavored shortening (regular works fine)
            - 1 cup sugar
            - ½ cup brown sugar
            - 2 eggs
            - 2 teaspoons vanilla
            - 2 cups flour
            - 1 teaspoon salt
            - 1 teaspoon baking soda
            - 1 cup oats
            - 1 cup chocolate chips
            - 1 cup M&Ms
        """,
        categories: [dessCategory, allCategory],
        servings: 24,
        time: 45,
        author: "Melanie Winder",
        dateAdded: ISO8601DateFormatter().date(from: "2024-11-25T00:00:00Z") ?? Date(),
        favorite: true,
        notes: "These cookies are perfect for parties and gatherings. The combination of oats, chocolate chips, and M&Ms makes them a crowd favorite!"
    )
    
    let chipperCookieRecipe = Recipe(
        name: "Chunky Chipper Cookies",
        instructions: """
            Preheat oven to 375°F. 
            In a large bowl, cream together the butter, sugars, and vanilla. Beat peanut butter, shortening, eggs, sugar, vanilla, and water until creamy. 
            Add sifted dry ingredients and blend well. Stir in chocolate chips. 
            Bake 10-12 min at 350.
        """,
        ingredients: """
            - 2 cups flour
            - 1 teaspoon baking soda
            - ½ teaspoon salt
            - 1/2 cup shortening
            - 1/2 cup peanut butter
            - 1/2 cup brown sugar
            - 1 teaspoon vanilla
            - 1 tablespoon water
            - 1 12 oz package of chocolate chips
        """,
        categories: [dessCategory, allCategory],
        servings: 24,
        time: 45,
        author: "Melanie Winder",
        dateAdded: ISO8601DateFormatter().date(from: "2024-11-25T00:00:00Z") ?? Date(),
        favorite: true,
        notes: "the big milk chocolate chips are the best"
    )
    
    let tacoSoupRecipe = Recipe(
        name: "Taco Soup",
        instructions: """
            Saute onions in olive oil. 
            Brown ground beef and remove fat. 
            Combine and stir in taco seasoning. 
            Add all other things. Simmer for 20min.
        """,
        ingredients: """
            - 1 lb ground beef
            - 1 onion
            - 1 can corn or frozen
            - 1 can dark red kidney beans
            - 1 package taco seasing or 3 tablespoons
            - 1 8oz can tomato sauce (15 oz work too)
            - 1 28 oz can stewed tomatoes
        """,
        categories: [allCategory, dinCategory],
        servings: 4,
        time: 60,
        author: "Melanie Winder",
        dateAdded: ISO8601DateFormatter().date(from: "2024-11-25T00:00:00Z") ?? Date(),
        favorite: false,
        notes: ""
    )
    
    let hamFriedRiceRecipe = Recipe(
        name: "Ham Fried Rice",
        instructions: """
            Cook rice the day before. Spread out and dry (if no time, that’s okay). Heat oil and add rice. Stir a few min. 
            Add onions, ham, and veg. Stir and heat. 
            Carefully pour beaten egg and stir until egg is cooked
        """,
        ingredients: """
            - 6 cups cooked rice
            - 2 tablespoons oil
            - 1/2 cup green onions
            - 1 cup ham
            - 2 eggs beaten
            - 1 lb frozen peas and carrots
        """,
        categories: [allCategory, dinCategory],
        servings: 10,
        time: 50,
        author: "Melanie Winder",
        dateAdded: ISO8601DateFormatter().date(from: "2024-11-25T00:00:00Z") ?? Date(),
        favorite: false,
        notes: ""
    )
    
    let broccoliRecipe = Recipe(
        name: "Broccoli and Cheese",
        instructions: """
            Peel and slice thick stems from broccoli. 
            Bring ¾ C water to simmer over medium low heat. Add stems and florets: cook, covered, until bright green, 4 min. 
            Stir in olive oil, garlic, salt, and red pepper. Cook 4 min. Turn off heat. Stir in vinegar.
        """,
        ingredients: """
            - 1 1/2 lb broccoli
            - 4 1/2 tablespoons olive oil
            - 1 minced garlic clove
            - 1/4 teaspoon salt
            - 1/8 teaspoon crushed red pepper
            - 1 1/2 teaspoon vinegar
        """,
        categories: [allCategory, appCategory],
        servings: 10,
        time: 10,
        author: "Melanie Winder",
        dateAdded: ISO8601DateFormatter().date(from: "2024-11-25T00:00:00Z") ?? Date(),
        favorite: false,
        notes: ""
    )
    
    let zucchiniBreadRecipe = Recipe(
        name: "Mom's Zucchini Bread",
        instructions: """
            Grease and flour two 8 x 4 inch pans. Preheat oven to 325 degrees F (165 degrees C). 
            Sift flour, salt, baking powder, soda, and cinnamon together in a bowl. Beat eggs, oil, vanilla, and sugar together in a large bowl. Add sifted ingredients to the creamed mixture, and beat well. 
            Stir in zucchini and nuts until well combined. 
            Pour batter into prepared pans. Bake for 40 to 60 minutes, or until tester inserted in the center comes out clean. 
            Cool in pan on rack for 20 minutes. Remove bread from pan, and completely cool.
        """,
        ingredients: """
            - 3 cups all purpose flour
            - 1 teaspoon salt
            - 1 teaspoon baking soda
            - 1 teaspoon baking powder
            - 1 tablespoon ground cinnamon
            - 3 large eggs
            - 1 cup vegetable oil
            - 2 1/4 cups white sugar
            - 3 teaspoons vanilla extract
            - 2 cups grated zucchini
            - 1 cup walnuts
        """,
        categories: [allCategory, breadCategory],
        servings: 10,
        time: 80,
        author: "Melanie Winder",
        dateAdded: ISO8601DateFormatter().date(from: "2024-11-25T00:00:00Z") ?? Date(),
        favorite: false ,
        notes: ""
    )
        
    
    // Save the data to the context
    context.insert(allCategory)
    context.insert(appCategory)
    context.insert(breakCategory)
    context.insert(dessCategory)
    context.insert(breadCategory)
    context.insert(snackCategory)
    context.insert(dinCategory)
    
    allCategory.recipes.append(cookieRecipe)
    dessCategory.recipes.append(cookieRecipe)
    
    allCategory.recipes.append(chipperCookieRecipe)
    dessCategory.recipes.append(chipperCookieRecipe)
    
    allCategory.recipes.append(tacoSoupRecipe)
    dinCategory.recipes.append(tacoSoupRecipe)
    
    allCategory.recipes.append(hamFriedRiceRecipe)
    dinCategory.recipes.append(hamFriedRiceRecipe)
    
    allCategory.recipes.append(broccoliRecipe)
    appCategory.recipes.append(broccoliRecipe)
    
    allCategory.recipes.append(zucchiniBreadRecipe)
    breadCategory.recipes.append(zucchiniBreadRecipe)
    
    context.insert(cookieRecipe)
    context.insert(chipperCookieRecipe)
    context.insert(tacoSoupRecipe)
    context.insert(hamFriedRiceRecipe)
    context.insert(broccoliRecipe)
    context.insert(zucchiniBreadRecipe)
    
    do {
        try context.save()
        print("Recipe and category relationship saved successfully!")
    } catch {
        print("Error saving data: \(error)")
    }
    
    //try? context.save()
}
