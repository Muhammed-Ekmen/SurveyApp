//
//  CategorySurveyCell.swift
//  UIComponents
//
//  Created by kingSemih on 11.06.2024.
//

import UIKit
import TinyConstraints

public class CategorySurveyCell: UITableViewCell, ReusableView {
    
    weak var viewModel: CategorySurveyCellProtocol?
    
    private let mainContentView = {
        let view = UIView()
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.borderWidth = 2
        view.layer.cornerRadius = 8
        return view
    }()
    
    private let titleLabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = .black
        label.textAlignment = .left
        label.numberOfLines = 2
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureContents()
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureContents()
        setupUI()
    }
    
    private func configureContents() {
        
    }
    
    public func setup(viewModel: CategorySurveyCellProtocol,isSelected:Bool? = nil) {
        self.viewModel = viewModel
        titleLabel.text = viewModel.title
        if isSelected == true {
            mainContentView.layer.borderColor = UIColor.green.cgColor
        }else{
            mainContentView.layer.borderColor = UIColor.lightGray.cgColor
        }
    }
    
}

//  MARK: - Layout
extension CategorySurveyCell{
    
    private func setupUI(){
        addMainContentView()
        addTitleLabel()
    }
    
    private func addMainContentView(){
        contentView.addSubview(mainContentView)
        mainContentView.edgesToSuperview(insets:  .vertical(16))
    }
    
    private func addTitleLabel(){
        mainContentView.addSubview(titleLabel)
        titleLabel.edgesToSuperview(insets: .horizontal(8) + .vertical(8))
    }
    
}
