//
//  HomeViewController.swift
//  SurveyApp
//
//  Created by kingSemih on 11.06.2024.
//

import UIKit
import TinyConstraints
import UIComponents

final class HomeViewController: BaseViewController<HomeViewModel> {
    
    private let titleLabel = {
        let label = UILabel()
        label.text = "Survey Categories"
        label.font = .systemFont(ofSize: 36, weight: .bold)
        label.textColor = .black
        label.textAlignment = .left
        label.numberOfLines = 1
        return label
    }()
    
    private let subtitleLabel = {
        let label = UILabel()
        label.text = "Populer Survey Categories"
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = .lightGray
        label.textAlignment = .left
        label.numberOfLines = 1
        return label
    }()
    
    private let textStack = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 12
        return stack
    }()
    
    private lazy var categoryCollectionView = {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1))
              let item = NSCollectionLayoutItem(layoutSize: itemSize)
                    
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.5))
              let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                    
              let section = NSCollectionLayoutSection(group: group)
            return section
        }
        layout.configuration.scrollDirection = .horizontal
        var collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        collectionView.alwaysBounceVertical = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.contentInsetAdjustmentBehavior = .never
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CategoryCell.self)
        collectionView.backgroundColor = .clear
        collectionView.isScrollEnabled = false
        return collectionView
    }()
    
    private let allSurveyTitleLabel = {
        let label = UILabel()
        label.text = "All Surveys"
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = .black
        label.textAlignment = .left
        label.numberOfLines = 1
        return label
    }()
    
    private lazy var allSurveyTableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.backgroundColor = .clear
        tableView.dataSource = self
        tableView.isScrollEnabled = true
        tableView.register(AllSurveyCell.self)
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
        eventSource()
    }
    
}

//  MARK: - EventSource
extension HomeViewController{
    
    private func eventSource(){
        reloadTableView()
    }
    
    private func reloadTableView() {
        viewModel.reloadTableView = { [weak self] in
            guard let self = self else {return}
            allSurveyTableView.reloadData()
        }
    }
    
}


// MARK: - Config
extension HomeViewController{
    
    private func config(){
        configView()
    }
    
    private func configView(){
        self.view.backgroundColor = .white
    }
    
}

//  MARK: - CollectionView
extension HomeViewController: UICollectionViewDataSource,UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItems()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: CategoryCell = collectionView.dequeueReusableCell(for: indexPath)
        let cellItem = viewModel.cellItemAt(indexPath: indexPath)
        cell.setup(viewModel: cellItem)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.didCollectionAction(indexPath: indexPath)
    }
        
}


//  MARK: - TableView
extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfTableItems()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: AllSurveyCell = tableView.dequeueReusableCell(for: indexPath)
        let cellItem = viewModel.cellTableItemAt(indexPath: indexPath)
        cell.setup(viewModel: cellItem,indexPath: indexPath)
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height / 4
    }
    
}


//  MARK: - Layout
extension HomeViewController{
    
    private func setupUI(){
        addTextStack()
        addCategoryCollectionView()
        addAllSurveyLabel()
        addTableView()
    }
    
    private func addTextStack(){
        view.addSubview(textStack)
        textStack.horizontalToSuperview(insets: .horizontal(16))
        textStack.topToSuperview(offset: 16,usingSafeArea: true)
        //items
        textStack.addArrangedSubview(titleLabel)
        textStack.addArrangedSubview(subtitleLabel)
    }
    
    private func addCategoryCollectionView(){
        view.addSubview(categoryCollectionView)
        categoryCollectionView.horizontalToSuperview()
        categoryCollectionView.topToBottom(of: textStack,offset: 8)
        categoryCollectionView.height(UIScreen.main.bounds.height/5.4)
    }
    
    private func addAllSurveyLabel(){
        view.addSubview(allSurveyTitleLabel)
        allSurveyTitleLabel.leadingToSuperview(offset: 16)
        allSurveyTitleLabel.topToBottom(of: categoryCollectionView,offset: 16)
    }
    
    private func addTableView(){
        view.addSubview(allSurveyTableView)
        allSurveyTableView.horizontalToSuperview(insets: .horizontal(16))
        allSurveyTableView.topToBottom(of: allSurveyTitleLabel,offset: 16)
        allSurveyTableView.bottomToSuperview(usingSafeArea: false)
    }
    
}


//  MARK: -Action
extension HomeViewController: AllSurveyCellDelegate{
    
    func agreeButtonTapped(indexPath: IndexPath) {
        viewModel.agreeButtonAction(indexPath: indexPath)
    }
    
    func dissAgreeButtonTapped(indexPath: IndexPath) {
        viewModel.disagreeButtonAction(indexPath: indexPath)
    }
    
}
