//
//  AllSurveyCellModel.swift
//  UIComponents
//
//  Created by kingSemih on 11.06.2024.
//

import Foundation
import UIKit

public protocol AllSurveyCellDataSource: AnyObject {
    var title:String {get set}
    var surveyImage: UIImage {get set}
    var subtitle:String {get set}
    var voterCount:Int {get set}
    var voteCount: Int {get set}
}

public protocol AllSurveyCellEventSource: AnyObject {
    
}

public protocol AllSurveyCellProtocol: AllSurveyCellDataSource, AllSurveyCellEventSource {
    
}

public final class AllSurveyCellModel: AllSurveyCellProtocol {
    
    public var title: String
    
    public var surveyImage: UIImage
    
    public var subtitle: String
    
    public var voterCount: Int
    
    public var voteCount: Int
    
    public init(title: String, surveyImage: UIImage, subtitle: String, voterCount: Int, voteCount: Int) {
        self.title = title
        self.surveyImage = surveyImage
        self.subtitle = subtitle
        self.voterCount = voterCount
        self.voteCount = voteCount
    }
    
    
}
