//
//  CategoryKeys.swift
//  Utilities
//
//  Created by kingSemih on 11.06.2024.
//

import Foundation
import UIKit

public enum CategoryKeys{
    case health,tech,love,sport
}


public extension CategoryKeys{
    
    func getStringData()->String{
        switch self {
        case .health:
            return "Health"
        case .love:
            return "Love"
        case .sport:
            return "Sport"
        case .tech:
            return "Tech"
        }
    }
    
    func getImage()-> UIImage{
        switch self {
        case .health:
            return .init(systemName: "stethoscope.circle.fill")!
        case .love:
            return .init(systemName: "heart.fill")!
        case .sport:
            return .init(systemName: "figure.gymnastics")!
        case .tech:
            return .init(systemName: "keyboard")!
        }
    }
    
}
