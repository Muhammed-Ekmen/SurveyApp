//
//  CategoryViewController.swift
//  SurveyApp
//
//  Created by kingSemih on 11.06.2024.
//

import UIKit
import TinyConstraints
import UIComponents

final class CategoryViewController: BaseViewController<CategoryViewModel> {
    
    private let backButton = {
        let button = UIBarButtonItem()
        button.image = .init(systemName: "chevron.left")!
        button.tintColor = .black
        return button
    }()
    
    private let titleLabel = {
        let label = UILabel()
        label.text = "Select Your Survey Question"
        label.font = .systemFont(ofSize: 36, weight: .bold)
        label.textColor = .black
        label.textAlignment = .left
        label.numberOfLines = 2
        return label
    }()
    
    private let createButton = {
        let button = UIButton()
        button.height(48)
        button.setTitle("Create", for: .normal)
        button.backgroundColor = .blue
        button.tintColor = .white
        button.layer.cornerRadius = 8
        return button
    }()
    
    private lazy var surveyTableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.backgroundColor = .clear
        tableView.dataSource = self
        tableView.isScrollEnabled = true
        tableView.register(CategorySurveyCell.self)
        tableView.contentInset = .init(top: 0, left: 0, bottom: 64, right: 0)
        tableView.separatorColor = .clear
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.didLoad()
        config()
        setupUI()
    }
    
}


//  MARK: - Config
extension CategoryViewController{
    
    private func config(){
        configView()
        configHeader()
        configBackButton()
        configCreateButton()
    }
    
    private func configView(){
        self.view.backgroundColor = .white
    }
    
    private func configHeader(){
        self.title = viewModel.categoryKey?.getStringData()
    }
    
    private func configBackButton(){
        backButton.target = self
        backButton.action = #selector(backButtonTapped)
    }
    
    private func configCreateButton(){
        createButton.addTarget(self, action: #selector(createButtonTapped), for: .touchUpInside)
    }
    
}


//  MARK: - Layout
extension CategoryViewController{
    
    private func setupUI(){
        addBackButton()
        addTitleLabel()
        addCreateButton()
        addTableView()
    }
    
    private func addBackButton(){
        self.navigationItem.leftBarButtonItem = backButton
    }
    
    private func addTitleLabel(){
        view.addSubview(titleLabel)
        titleLabel.topToSuperview(offset: 16,usingSafeArea: true)
        titleLabel.horizontalToSuperview(insets: .horizontal(16))
    }
    
    private func addCreateButton(){
        view.addSubview(createButton)
        createButton.horizontalToSuperview(insets: .horizontal(16))
        createButton.bottomToSuperview(usingSafeArea: true)
    }
    
    private func addTableView(){
        view.addSubview(surveyTableView)
        surveyTableView.horizontalToSuperview(insets: .horizontal(16))
        surveyTableView.topToBottom(of: titleLabel,offset: 8)
        surveyTableView.bottomToTop(of: createButton,offset: -8)
    }
    
}


//  MARK: - TableView
extension CategoryViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItems()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : CategorySurveyCell = tableView.dequeueReusableCell(for: indexPath)
        let cellItem = viewModel.cellItemAt(indexPath: indexPath)
        let isSelect = viewModel.selectedIndexPathRow == indexPath.row
        cell.setup(viewModel: cellItem,isSelected: isSelect)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.selectedIndexPathRow = indexPath.row
        tableView.reloadData()
    }
    
}


// MARK: - Action
extension CategoryViewController{
    
    @objc
    private func backButtonTapped(){
        viewModel.backButtonAction()
    }
    
    @objc
    private func createButtonTapped(){
        viewModel.createButtonAction()
    }
    
}

