//
//  CategoryCell.swift
//  UIComponents
//
//  Created by kingSemih on 11.06.2024.
//

import UIKit
import TinyConstraints

public class CategoryCell: UICollectionViewCell, ReusableView {
    
    weak var viewModel: CategoryCellProtocol?
    
    private let mainContentView = {
        let view = UIView()
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.borderWidth = 2
        view.layer.cornerRadius = 8
        return view
    }()
    
    private let contentStack = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 0
        stack.distribution = .fillProportionally
        return stack
    }()
    
    private let titleLabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = .lightGray
        label.textAlignment = .center
        label.numberOfLines = 1
        return label
    }()
    
    private let cellIcon = {
        let icon = UIImageView()
        icon.contentMode = .scaleAspectFit
        return icon
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureContents()
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureContents()
        setupUI()
    }
    
    private func configureContents() {
    }
    
    public func setup(viewModel: CategoryCellProtocol) {
        self.viewModel = viewModel
        titleLabel.text = viewModel.title
        cellIcon.image = viewModel.icon
    }
    
}

//  MARK: -Config
extension CategoryCell{
    
   
}

//  MARK: -Layout
extension CategoryCell{
    
    private func setupUI(){
        addContentView()
        addContentStack()
    }
    
    private func addContentView(){
        contentView.addSubview(mainContentView)
        mainContentView.edgesToSuperview(insets: .horizontal(16) + .vertical(16))
    }
    
    private func addContentStack(){
        mainContentView.addSubview(contentStack)
        contentStack.edgesToSuperview(insets: .horizontal(8) + .vertical(8))
        //items
        contentStack.addArrangedSubview(cellIcon)
        contentStack.addArrangedSubview(titleLabel)
    }
    
    
}
