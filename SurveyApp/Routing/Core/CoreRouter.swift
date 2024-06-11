//
//  CoreRouter.swift
//  SurveyApp
//
//  Created by kingSemih on 11.06.2024.
//


import Foundation
import UIKit

protocol RouterProtocol:AnyObject{
    var viewController:UIViewController? {get}
    var openTransition:Transition? {get}
    func open(_ viewController:UIViewController,transition:Transition)
    func close()
}

class Router:RouterProtocol{
    
    var openTransition: Transition?
    
    weak var viewController: UIViewController?
    
    func open(_ viewController: UIViewController, transition: Transition) {
        transition.viewController = self.viewController
        transition.open(viewController)
    }
    
    func close() {
        guard let openTransition = openTransition else {
            assertionFailure("You Have To Add Transition To Close")
            return
        }
        guard let viewCtrl = viewController else {
            assertionFailure("There Is No Any View Controller")
            return
        }
        openTransition.close(viewCtrl)
    }
    
    
    
}
