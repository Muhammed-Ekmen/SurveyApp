//
//  CategoryCellModel.swift
//  UIComponents
//
//  Created by kingSemih on 11.06.2024.
//

import Foundation
import UIKit

public protocol CategoryCellDataSource: AnyObject {
    var title: String {get set}
    var icon: UIImage {get set}
}

public protocol CategoryCellEventSource: AnyObject {
    
}

public protocol CategoryCellProtocol: CategoryCellDataSource, CategoryCellEventSource {
    
}

public final class CategoryCellModel: CategoryCellProtocol {
    
    public var title: String
    
    public var icon: UIImage
    
    public init(title: String, icon: UIImage) {
        self.title = title
        self.icon = icon
    }
    
}
