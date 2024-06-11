//
//  BaseViewModel.swift
//  SurveyApp
//
//  Created by kingSemih on 11.06.2024.
//

import Foundation
import Utilities
import UIKit

protocol BaseViewModelDataSource:AnyObject{}

protocol BaseViewModelEventSource:AnyObject{
    //MARK: Loading Indicator Closures
    var enableLoadingClosure:VoidClosure {get set}
    var disableLoadingClosure:VoidClosure {get set}
}

protocol BaseViewModelProtocol:BaseViewModelDataSource,BaseViewModelEventSource{}


class BaseViewModel<R:Router>:BaseViewModelProtocol{
    
    var enableLoadingClosure: VoidClosure = {
    }
    
    var disableLoadingClosure: VoidClosure = {
        
    }
    
    var router:R
   
    init(router: R) {
        self.router = router
    }
    
    
}
