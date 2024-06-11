//
//  CategorySurveyCellModel.swift
//  UIComponents
//
//  Created by kingSemih on 11.06.2024.
//

import Foundation

public protocol CategorySurveyCellDataSource: AnyObject {
    var title: String {get set}
}

public protocol CategorySurveyCellEventSource: AnyObject {
    
}

public protocol CategorySurveyCellProtocol: CategorySurveyCellDataSource, CategorySurveyCellEventSource {
    
}

public final class CategorySurveyCellModel: CategorySurveyCellProtocol {
    
    public var title: String
    
    public init(title: String) {
        self.title = title
    }
    
}
