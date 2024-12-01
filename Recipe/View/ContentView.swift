//
//  ContentView.swift
//  Recipe
//
//  Created by IS 543 on 11/15/24.
//

import SwiftUI
import SwiftData
import MarkdownUI

struct ContentView: View {
    @Environment(RecipeViewModel.self) private var viewModel
    @State private var recipeToEdit: Recipe?
    
    var body: some View {
            NavigationSplitView {
                List {
                    ForEach(viewModel.allCategories) { category in
                        NavigationLink {
                            // Filter the recipes by the selected category
                            List(category.recipes) { recipe in
                                NavigationLink {
                                    VStack(alignment: .leading, spacing: 10) {
                                        Markdown("# \(recipe.name)")
                                        Markdown(recipe.instructions)
                                        Markdown(recipe.ingredients)
                                        Button("Edit Recipe") {
                                            recipeToEdit = recipe
                                        }
                                        .buttonStyle(.bordered)
                                        .padding(.top)
                                    }
                                    .padding()
                                    .markdownTheme(.gitHub)
                                } label: {
                                    Text(recipe.name)
                                }

                            }
                        } label: {
                            Text(category.name)
                        }
                    }
                }
            } content: {
                List {
                    ForEach(viewModel.allRecipes) { recipe in
                        NavigationLink {
                            VStack(alignment: .leading, spacing: 10) {
                                Markdown("# \(recipe.name)")
                                Markdown(recipe.instructions)
                                Markdown(recipe.ingredients)
                                Button("Edit Recipe") {
                                    recipeToEdit = recipe
                                }
                                .buttonStyle(.bordered)
                                .padding(.top)
                                
                            }
                            .padding()
                            .markdownTheme(.gitHub)
                        } label: {
                            Text(recipe.name)
                        }
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        EditButton()
                    }
                    ToolbarItem {
                        Button(action: addItem) {
                            Label("Add Item", systemImage: "plus")
                        }
                    }
                }
            } detail: {
                Text("Select a recipe")
            }
            .sheet(item: $recipeToEdit) { recipe in
                RecipeEditorView(recipe: recipe)
            }
        }


    private func addItem() {
        withAnimation {
//            let newRecipe = Recipe(name: "#\(Date())", ingredient: "some **ingredients**", instructions: "some                        *instructions*")
 //           modelContext.insert(newRecipe)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
//            for index in offsets {
//                modelContext.delete(viewModel.recipes[index])
//            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: [Recipe.self, Category.self], inMemory: true)
}
