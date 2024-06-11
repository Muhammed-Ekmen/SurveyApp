//
//  BaseViewModel.swift
//  SurveyApp
//
//  Created by kingSemih on 11.06.2024.
//

import Foundation
import Utilities
import UIKit
import UIComponents

protocol BaseViewModelDataSource:AnyObject{}

protocol BaseViewModelEventSource:AnyObject{}

protocol BaseViewModelProtocol:BaseViewModelDataSource,BaseViewModelEventSource{}


class BaseViewModel<R:Router>:BaseViewModelProtocol{
    
    var categoryKey: CategoryKeys?
    
    var router:R
    
    var addedModel: AllSurveyCellModel?
   
    init(router: R,categoryKey: CategoryKeys? = nil,model:AllSurveyCellModel? = nil) {
        self.router = router
        self.categoryKey = categoryKey
        self.addedModel = model
    }

}
