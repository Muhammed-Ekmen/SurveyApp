//
//  CategoryViewModel.swift
//  SurveyApp
//
//  Created by kingSemih on 11.06.2024.
//

import Foundation
import UIComponents

protocol CategoryViewDataSource {
    func numberOfItems()-> Int
    func cellItemAt(indexPath: IndexPath)-> CategorySurveyCellProtocol
}

protocol CategoryViewEventSource {
    func didLoad()
}

protocol CategoryViewProtocol: CategoryViewDataSource, CategoryViewEventSource {}

final class CategoryViewModel: BaseViewModel<CategoryRouter>, CategoryViewProtocol {
    
    private var items: [CategorySurveyCellProtocol] = []
    
    var selectedIndexPathRow: Int?
    
    func didLoad() {
        configItems()
    }
    
}


//  MARK: - Config
extension CategoryViewModel{
    
    private func configItems(){
        switch categoryKey {
        case .health:
            items = [
                CategorySurveyCellModel(title: "I believe regular exercise is important for maintaining good health."),
                CategorySurveyCellModel(title: "I think eating a balanced diet is crucial for overall well-being."),
                CategorySurveyCellModel(title: "I believe getting enough sleep is essential for good health."),
                CategorySurveyCellModel(title: "I agree that managing stress is important for maintaining a healthy lifestyle.")
            ]
        case .love:
            items = [
                CategorySurveyCellModel(title: "I believe communication is key in a successful relationship."),
                CategorySurveyCellModel(title: "I think spending quality time together strengthens bonds in a relationship."),
                CategorySurveyCellModel(title: "I believe showing appreciation and affection is important in a relationship."),
                CategorySurveyCellModel(title: "I agree that trust is the foundation of a healthy relationship.")
            ]
        case .sport:
            items = [
                CategorySurveyCellModel(title: "I enjoy participating in sports and physical activities."),
                CategorySurveyCellModel(title: "I believe teamwork is essential for success in sports."),
                CategorySurveyCellModel(title: "I think setting goals and striving to achieve them is important in sports."),
                CategorySurveyCellModel(title: "I agree that sports promote physical and mental well-being.")
            ]
        case .tech:
            items = [
                CategorySurveyCellModel(title: "I enjoy keeping up with the latest technological advancements."),
                CategorySurveyCellModel(title: "I believe technology has made our lives easier and more convenient."),
                CategorySurveyCellModel(title: "I think it's important to stay informed about digital privacy and security."),
                CategorySurveyCellModel(title: "I agree that technology has the potential to solve many global challenges.")
            ]
        default:
            items = []
        }
    }
    
}


// MARK: - DataProvider
extension CategoryViewModel{
    
    func numberOfItems() -> Int {
        return items.count
    }
    
    func cellItemAt(indexPath: IndexPath) -> CategorySurveyCellProtocol {
        return items[indexPath.row]
    }
    
}


//  MARK: - Action
extension CategoryViewModel{

    func createButtonAction(){
        guard let index = selectedIndexPathRow else {return}
        let item = items[index]
        guard let image = categoryKey?.getImage() else { return  }
        guard let categoryKey = categoryKey else { return  }
        let model = AllSurveyCellModel(
            categoryKey: categoryKey,
            surveyImage: image,
            subtitle: item.title,
            voterCount: HomeViewModel.totalVoters,
            voteCount: 0
        )
        router.pushHome(model: model)
    }
    
    func backButtonAction(){
        router.pushHome()
    }
    
}
