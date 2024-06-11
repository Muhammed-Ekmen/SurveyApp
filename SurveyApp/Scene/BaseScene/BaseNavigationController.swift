//
//  BaseNavigationController.swift
//  SurveyApp
//
//  Created by kingSemih on 11.06.2024.
//


import Foundation
import UIKit

class BaseNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureContents()
        interactivePopGestureRecognizer?.delegate = nil
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }
    
    private func configureContents() {
        let attributed: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.black,
            .font:UIFont.systemFont(ofSize: 16, weight: .semibold)
        ]
        let appearance = UINavigationBarAppearance()
        let backButtonAppearance = UIBarButtonItemAppearance()
        backButtonAppearance.normal.titleTextAttributes = attributed
        
        appearance.backButtonAppearance = backButtonAppearance
        appearance.backgroundColor = .white
        appearance.titleTextAttributes = attributed
        appearance.largeTitleTextAttributes = attributed

        UINavigationBar.appearance().tintColor = .black
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
}
