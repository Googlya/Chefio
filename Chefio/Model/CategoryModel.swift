//
//  CategoryModel.swift
//  Chefio
//
//  Created by Александр Фарносов on 20.05.2022.
//

import Foundation

enum CategoryModel: CaseIterable {
    case all
    case food
    case drink
    
    var title: String {
        switch self{
        case .all:
            return "All"
        case .food:
            return "Food"
        case .drink:
            return "Drink"
        }
    }
}
