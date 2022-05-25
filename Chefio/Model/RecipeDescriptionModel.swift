//
//  RecipeDescriptionModel.swift
//  Chefio
//
//  Created by Александр Фарносов on 23.05.2022.
//

import Foundation

struct RecipeDescriptionModel: Hashable {
    var id: Int
    var title: String
    var image: String
    var category: CategoryModel
    var time: Int
    var author: AuthorModel
    var likes: Int
    var description: String
    var ingredients: [IngredientsGroupModel]
    var steps: [RecipeStepsModel]
    
    static func == (lhs: RecipeDescriptionModel, rhs: RecipeDescriptionModel) -> Bool {
        return lhs.id == rhs.id && lhs.title == rhs.title && lhs.image == rhs.image && lhs.category == rhs.category && lhs.time == rhs.time && lhs.author == rhs.author && lhs.likes == rhs.likes && lhs.description == rhs.description && lhs.ingredients == rhs.ingredients && lhs.steps == rhs.steps
    }
}

struct IngredientsGroupModel: Hashable {
    var name: String
    var childs: [String]
}

struct RecipeStepsModel: Hashable {
    var description: String
    var image: String
}
