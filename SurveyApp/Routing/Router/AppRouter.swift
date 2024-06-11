//
//  AppRouter.swift
//  SurveyApp
//
//  Created by kingSemih on 11.06.2024.
//

import Foundation
import UIKit

final class AppRouter: Router,AppRouter.Routes {
    
    static let shared = AppRouter() // Singleton Usage
    
    typealias Routes = SplashRoute
    
    weak var window: UIWindow?
    
    func topViewController() -> UIViewController? {
        if let navigationController = UIApplication.shared.windows.first?.rootViewController as? UINavigationController {
            if let topViewController = navigationController.topViewController {
                return topViewController
            }
        }
        return nil
    }
    
    override func open(_ viewController: UIViewController, transition: Transition) {
        self.viewController = topViewController()
        super.open(viewController, transition: transition)
    }
    
    func startApp() {
        AppRouter.shared.pushSplash()
    }
}
