//
//  SplashRoute.swift
//  SurveyApp
//
//  Created by kingSemih on 11.06.2024.
//

protocol SplashRoute {
    func pushSplash()
}

extension SplashRoute where Self: RouterProtocol {
    
    func pushSplash() {
        let router = SplashRouter()
        let viewModel = SplashViewModel(router: router)
        let viewController = SplashViewController(viewModel: viewModel)
        
        let transition = PlaceOnWindowTransition()
        router.viewController = viewController
        router.openTransition = transition
        
        open(viewController, transition: transition)
    }
}
