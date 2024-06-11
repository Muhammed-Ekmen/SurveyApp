//
//  HomeViewModel.swift
//  SurveyApp
//
//  Created by kingSemih on 11.06.2024.
//

import Foundation
import UIComponents
import Utilities

protocol HomeViewDataSource {
    func numberOfItems()->Int
    func cellItemAt(indexPath:IndexPath)->CategoryCellProtocol
    func numberOfTableItems()-> Int
    func cellTableItemAt(indexPath:IndexPath)-> AllSurveyCellProtocol
}

protocol HomeViewEventSource {
    func didLoad()
    var reloadTableView: VoidClosure? {get set}
}

protocol HomeViewProtocol: HomeViewDataSource, HomeViewEventSource {
    func didCollectionAction(indexPath: IndexPath)
    func agreeButtonAction(indexPath: IndexPath)
    func disagreeButtonAction(indexPath: IndexPath)
}

final class HomeViewModel: BaseViewModel<HomeRouter>, HomeViewProtocol {
    
    private let totalVoters = 50
    
    var reloadTableView: VoidClosure?
    
    private var items:[CategoryCellProtocol] = [
        CategoryCellModel(title: "Health", icon: .init(systemName: "stethoscope.circle.fill")!),
        CategoryCellModel(title: "Sport", icon: .init(systemName: "figure.gymnastics")!),
        CategoryCellModel(title: "Love", icon: .init(systemName: "heart.fill")!),
        CategoryCellModel(title: "Tech", icon: .init(systemName: "keyboard")!)
    ]
    
    private var tableItems: [AllSurveyCellProtocol] = []
    
    func didLoad() {
        configTableItems()
    }
    
}

//  MARK: - Config
extension HomeViewModel{
    
    private func configTableItems(){
        tableItems = [
            AllSurveyCellModel(title: "Healht", surveyImage: .init(systemName: "stethoscope.circle.fill")!, subtitle: "Chickens are Really Healthy?", voterCount: self.totalVoters, voteCount: 12),
            AllSurveyCellModel(title: "Love", surveyImage: .init(systemName: "heart.fill")!, subtitle: "Long Distance Relationship is better?", voterCount: self.totalVoters, voteCount: 24),
            AllSurveyCellModel(title: "Tech", surveyImage: .init(systemName: "stethoscope.circle.fill")!, subtitle: "The Best Programming Lang is Swift?", voterCount: self.totalVoters, voteCount: 6),
            AllSurveyCellModel(title: "Love", surveyImage: .init(systemName: "stethoscope.circle.fill")!, subtitle: "Women Loves Tall man?", voterCount: self.totalVoters, voteCount: 40)
        ]
    }
    
}


//  MARK: - DataProvider
extension HomeViewModel{
    
    func numberOfItems()->Int {
        return items.count
    }
    
    func cellItemAt(indexPath: IndexPath)->CategoryCellProtocol {
        return items[indexPath.row]
    }
    
    
    func numberOfTableItems() -> Int {
        tableItems.count
    }
    
    func cellTableItemAt(indexPath: IndexPath) -> AllSurveyCellProtocol {
        return tableItems[indexPath.row]
    }
    
}


//  MARK: - Action
extension HomeViewModel{
    
    func didCollectionAction(indexPath: IndexPath) {
        print("clciked \(indexPath.row)")
    }
    
    
    func agreeButtonAction(indexPath: IndexPath) {
        tableItems[indexPath.row].voteCount += 1
        reloadTableView?()
    }
    
    func disagreeButtonAction(indexPath: IndexPath) {
        tableItems[indexPath.row].voteCount -= 1
        reloadTableView?()
    }
    
}
