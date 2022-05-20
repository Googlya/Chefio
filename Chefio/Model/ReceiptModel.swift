//
//  ReceiptModel.swift
//  Chefio
//
//  Created by Александр Фарносов on 20.05.2022.
//

import Foundation

struct ReceiptModel {
    var id: Int
    var title: String
    var image: String
    var category: CategoryModel
    var time: Int
    var author: AuthorModel
}
