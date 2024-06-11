//
//  HomeRoute.swift
//  SurveyApp
//
//  Created by kingSemih on 11.06.2024.
//

import UIComponents

protocol HomeRoute {
    func pushHome(model:AllSurveyCellModel?)
}

extension HomeRoute where Self: RouterProtocol {
    
    func pushHome(model:AllSurveyCellModel? = nil) {
        let router = HomeRouter()
        let viewModel = HomeViewModel(router: router,model: model)
        let viewController = HomeViewController(viewModel: viewModel)
        
        let transition = PlaceOnWindowTransition()
        router.viewController = viewController
        router.openTransition = transition
        
        open(viewController, transition: transition)
    }
}
