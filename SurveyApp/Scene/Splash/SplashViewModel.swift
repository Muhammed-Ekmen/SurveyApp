//
//  SplashViewModel.swift
//  SurveyApp
//
//  Created by kingSemih on 11.06.2024.
//

import Foundation
import UIComponents
import Utilities
import UIKit


protocol SplashViewDataSource {}

protocol SplashViewEventSource {}

protocol SplashViewProtocol: SplashViewDataSource, SplashViewEventSource {
}

final class SplashViewModel: BaseViewModel<SplashRouter>, SplashViewProtocol {
        
    func didLoad() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1){
            self.router.pushHome()
        }
    }
    
}
