//
//  Recipe.swift
//  Recipe
//
//  Created by IS 543 on 11/15/24.
//
// Any inspiration I had came from previous assignments and what we talked about in class

import Foundation
import SwiftData

protocol RecipeDatabase {
    var recipes: [Recipe] { get }
    var categories: [Category] { get }
}

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
