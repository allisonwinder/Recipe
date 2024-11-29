//
//  Recipe.swift
//  Recipe
//
//  Created by IS 543 on 11/15/24.
//
import Foundation
import SwiftData

@Model
class Recipe: Identifiable {
    @Attribute(.unique) var name: String
    var instructions: String
    var ingredients: String
    @Relationship(deleteRule: .nullify) var categories: [Category] = []     // Nullifies relationship, does not delete
    var servings: Int
    var time: Int
    var author: String
    var dateAdded: Date
    var favorite: Bool
    var notes: String

    init(name: String, instructions: String, ingredients: String, categories: [Category] = [], servings: Int = 0, time: Int = 0, author: String = "", dateAdded: Date = .init(), favorite: Bool = false, notes: String = "") {
        self.name = name
        self.instructions = instructions
        self.ingredients = ingredients
        self.categories = categories
        self.servings = servings
        self.time = time
        self.author = author
        self.dateAdded = dateAdded
        self.favorite = favorite
        self.notes = notes
    }
}

@Model
class Category: Identifiable {
    @Attribute(.unique) var name: String
    @Relationship(deleteRule: .nullify, inverse: \Recipe.categories) var recipes: [Recipe] = [] // Nullifies relationship, does not delete
    init(name: String, recipes: [Recipe] = []) {
        self.name = name
        self.recipes = recipes
    }
}

//@Model
//class Ingredient: Identifiable {
//    @Attribute(.unique) var id: UUID
//    var name: String
//    var quantity: Double
//    var unit: String
//    @Relationship var recipe: Recipe? // One-to-many: Recipe -> Ingredients
//
//    init(name: String, quantity: Double, unit: String, recipe: Recipe? = nil) {
//        self.id = UUID()
//        self.name = name
//        self.quantity = quantity
//        self.unit = unit
//        self.recipe = recipe
//    }
//}
//
//@Model
//class Instruction: Identifiable {
//    @Attribute(.unique) var id: UUID
//    var stepNumber: Int
//    var instructionStep: String
//    @Relationship var recipe: Recipe? // One-to-many: Recipe -> Instructions
//
//    init(stepNumber: Int, instructionStep: String, recipe: Recipe? = nil) {
//        self.id = UUID()
//        self.stepNumber = stepNumber
//        self.instructionStep = instructionStep
//        self.recipe = recipe
//    }
//}




