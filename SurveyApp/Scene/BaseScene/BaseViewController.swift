//
//  BaseViewController.swift
//  SurveyApp
//
//  Created by kingSemih on 11.06.2024.
//


import Foundation
import UIKit

class BaseViewController< V: BaseViewModelProtocol>:UIViewController{
    
    let deviceWidth = UIScreen.main.bounds.width
    let deviceHeight = UIScreen.main.bounds.height
    
    var viewModel:V
    
    init(viewModel: V) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}


extension UIViewController{
    
    @objc
    func scrollProcess(){}

}
