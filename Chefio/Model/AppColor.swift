//
//  ColorEnum.swift
//  Chefio
//
//  Created by Александр Фарносов on 26.05.2022.
//

import Foundation
import SwiftUI

enum AppColor {
    case primary
    case secondary
    case secondaryText
    case mainText
    case outline
    case form
    
    var color: Color {
        switch self {
        case .primary:
            return Color("primary")
        case .secondary:
            return Color("secondary")
        case .secondaryText:
            return Color("secondaryText")
        case .mainText:
            return Color("mainText")
        case .outline:
            return Color("outline")
        case .form:
            return Color("form")
        }
    }
}
