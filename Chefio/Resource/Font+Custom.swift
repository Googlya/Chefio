//
//  FontsExtension.swift
//  Chefio
//
//  Created by Александр Фарносов on 19.05.2022.
//

import Foundation
import SwiftUI

//Header
extension Font {
    static var h1: Font {
        return .system(size: 22, weight: .bold, design: .default)
    }
    
    static var h2: Font {
        return .system(size: 17, weight: .bold, design: .default)
    }
    
    static var h3: Font {
        return .system(size: 15, weight: .bold, design: .default)
    }
}

//Body
extension Font {
    static var p1: Font {
        return .system(size: 17, weight: .medium, design: .default)
    }
    
    static var p2: Font {
        return .system(size: 15, weight: .medium, design: .default)
    }
    
    static var s: Font {
        return .system(size: 12, weight: .medium, design: .default)
    }
}

