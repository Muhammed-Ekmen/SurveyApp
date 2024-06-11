//
//  CategoryCellModel.swift
//  UIComponents
//
//  Created by kingSemih on 11.06.2024.
//

import Foundation
import UIKit
import Utilities

public protocol CategoryCellDataSource: AnyObject {
    var title: String {get set}
    var icon: UIImage {get set}
    var categoryKey: CategoryKeys {get set}
}

public protocol CategoryCellEventSource: AnyObject {
    
}

public protocol CategoryCellProtocol: CategoryCellDataSource, CategoryCellEventSource {
    
}

public final class CategoryCellModel: CategoryCellProtocol {
    
    public var categoryKey: CategoryKeys
    
    public var title: String
    
    public var icon: UIImage
    
    public init(categoryKey: CategoryKeys, title: String, icon: UIImage) {
        self.categoryKey = categoryKey
        self.title = title
        self.icon = icon
    }
    
}
