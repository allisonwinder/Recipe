//
//  CategoryManagerView.swift
//  Recipe
//
//  Created by IS 543 on 11/30/24.
//

import SwiftUI
import SwiftData

struct CategoryManagerView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(RecipeViewModel.self) private var viewModel
    @State private var newCategoryName: String = ""
    @State private var editingCategory: Category? = nil

    var body: some View {
        NavigationView {
            List {
                // List of categories
                ForEach(viewModel.allCategories) { category in
                    HStack {
                        Text(category.name)
                        Spacer()
                        Button("Edit") {
                            editingCategory = category
                        }
                        .buttonStyle(.borderless)
                        Button {
                            viewModel.deleteCategory(category: category)
                        } label: {
                            Image(systemName: "trash")
                                .foregroundColor(.red)
                        }
                    }
                }
                .sheet(item: $editingCategory) { category in
                    EditCategoryView(category: category)
                }

                // Add new category
                HStack {
                    TextField("New Category", text: $newCategoryName)
                        .textFieldStyle(.roundedBorder)
                    Button {
                        viewModel.addCategory(name: newCategoryName)
                        newCategoryName = ""

                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .foregroundColor(.blue)
                    }
                    .disabled(newCategoryName.isEmpty)
                }
            }
            .navigationTitle("Manage Categories")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Close") {
                        dismiss()
                    }
                }
            }
        }
    }
}

