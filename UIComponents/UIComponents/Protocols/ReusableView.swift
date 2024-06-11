//
//  ReusableView.swift
//  UIComponents
//
//  Created by kingSemih on 11.06.2024.
//

import Foundation
import UIKit

public protocol ReusableView: AnyObject {
    static var reuseIdentifier: String { get }
}

public extension ReusableView where Self: UIView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
