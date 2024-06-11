//
//  CategoryRoute.swift
//  SurveyApp
//
//  Created by kingSemih on 11.06.2024.
//

import Utilities

protocol CategoryRoute {
    func pushCategory(categoryKey:CategoryKeys)
}

extension CategoryRoute where Self: RouterProtocol {
    
    func pushCategory(categoryKey:CategoryKeys) {
        let router = CategoryRouter()
        let viewModel = CategoryViewModel(router: router,categoryKey: categoryKey)
        let viewController = CategoryViewController(viewModel: viewModel)
        let navigationController = BaseNavigationController(rootViewController: viewController)
        
        let transition = PlaceOnWindowTransition()
        router.viewController = viewController
        router.openTransition = transition
        
        open(navigationController, transition: transition)
    }
}
