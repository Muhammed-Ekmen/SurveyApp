//
//  AppDelegate.swift
//  SurveyApp
//
//  Created by kingSemih on 11.06.2024.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window:UIWindow? = nil
    static let shared = UIApplication.shared.delegate as! AppDelegate


    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        enableIQKeyboardManager()
        let bounds = UIScreen.main.bounds
        self.window = UIWindow(frame: bounds)
        self.window?.makeKeyAndVisible()
        AppRouter.shared.window = window
        AppRouter.shared.startApp()
        return true
    }
    
    // swiftlint:disable fatal_error unused_closure_parameter
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Survey App")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

}
