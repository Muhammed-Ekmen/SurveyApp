//
//  PlaceOnWindowTransition.swift
//  SurveyApp
//
//  Created by kingSemih on 11.06.2024.
//

import Foundation
import UIKit

protocol Transition: AnyObject {
    var viewController: UIViewController? { get set }

    func open(_ viewController: UIViewController)
    func close(_ viewController: UIViewController)
}

class PlaceOnWindowTransition:Transition{
    
    
    func open(_ viewController: UIViewController) {
        guard let window:UIWindow = UIApplication.shared.windows.first else {return}
        UIView.transition(
            with: window,
            duration: 0.5,
            options: .curveEaseIn,
            animations: {
                UIView.performWithoutAnimation {window.rootViewController = viewController}
            }
        )
    }
    
    func close(_ viewController: UIViewController) {}
    
    
    var viewController: UIViewController?
    
    
}
