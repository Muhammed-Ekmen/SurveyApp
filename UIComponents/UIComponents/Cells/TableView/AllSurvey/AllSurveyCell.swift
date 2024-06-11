//
//  AllSurveyCell.swift
//  UIComponents
//
//  Created by kingSemih on 11.06.2024.
//

import UIKit

public protocol AllSurveyCellDelegate:AnyObject{
    
    func agreeButtonTapped(indexPath:IndexPath)
    
    func dissAgreeButtonTapped(indexPath:IndexPath)
    
}

public class AllSurveyCell: UITableViewCell, ReusableView {
    
    weak var viewModel: AllSurveyCellProtocol?
    
    public weak var delegate: AllSurveyCellDelegate?
    
    private var indexPath:IndexPath?
    
    private let mainContentView = {
        let view = UIView()
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.borderWidth = 2
        view.layer.cornerRadius = 8
        return view
    }()
    
    private let contentStack = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 8
        stack.alignment = .leading
        stack.distribution = .fillProportionally
        return stack
    }()
    
    private let titleLabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = .black
        label.textAlignment = .left
        label.numberOfLines = 1
        return label
    }()
    
    private let subtitleLabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.textColor = .lightGray
        label.textAlignment = .left
        label.numberOfLines = 3
        return label
    }()
    
    private let voteLabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.textColor = .lightGray
        label.textAlignment = .left
        label.numberOfLines = 3
        return label
    }()
    
    private let cellIcon = {
        let icon = UIImageView()
        icon.contentMode = .scaleAspectFit
        icon.layer.cornerRadius = 8
        return icon
    }()
    
    private let percentageView = UIProgressView(progressViewStyle: .default)
    
    private let buttonStack = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 12
        stack.distribution = .fillEqually
        return stack
    }()
    
    private let agreeButton = {
        let button = UIButton()
        button.height(48)
        button.setTitle("Agree 🤙🏻", for: .normal)
        button.backgroundColor = .blue
        button.tintColor = .white
        button.layer.cornerRadius = 8
        return button
    }()
    
    private let dissagreeButton = {
        let button = UIButton()
        button.height(48)
        button.setTitle("DissAgree 👎🏻", for: .normal)
        button.backgroundColor = .red
        button.tintColor = .white
        button.layer.cornerRadius = 8
        return button
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
        configPercent()
        configButtons()
    }
    
    public func setup(viewModel: AllSurveyCellProtocol,indexPath:IndexPath) {
        self.indexPath = indexPath
        self.viewModel = viewModel
        cellIcon.image = viewModel.surveyImage
        titleLabel.text = viewModel.categoryKey.getStringData()
        subtitleLabel.text = viewModel.subtitle
        voteLabel.text = "🚀 \(viewModel.voteCount)/\(viewModel.voterCount)"
        updatePercentage(voteCount: viewModel.voteCount, voterCount: viewModel.voterCount)
    }
    
}


// MARK: - Config
extension AllSurveyCell{
    
    private func configPercent(){
        percentageView.progressTintColor = UIColor.blue
        percentageView.trackTintColor = UIColor.lightGray
    }
    
    private func configButtons(){
        agreeButton.addTarget(self, action: #selector(agreeButtonTapped), for: .touchUpInside)
        dissagreeButton.addTarget(self, action: #selector(disagreeButtonTapped), for: .touchUpInside)
    }
    
}


// MARK: - Layout
extension AllSurveyCell{
    
    private func setupUI(){
        addMainContentView()
        addImage()
        addContentStack()
        addPercent()
        addButtonStack()
    }
    
    private func addMainContentView(){
        contentView.addSubview(mainContentView)
        mainContentView.horizontalToSuperview(insets: .horizontal(16))
        mainContentView.topToSuperview(offset: 16)
    }
    
    private func addImage(){
        mainContentView.addSubview(cellIcon)
        cellIcon.verticalToSuperview(insets: .vertical(8))
        cellIcon.leadingToSuperview(offset: 8)
    }
    
    private func addContentStack(){
        mainContentView.addSubview(contentStack)
        contentStack.horizontalToSuperview(insets: .left(40))
        contentStack.verticalToSuperview(insets: .vertical(16))
        //items
        contentStack.addArrangedSubview(titleLabel)
        contentStack.addArrangedSubview(subtitleLabel)
        contentStack.addArrangedSubview(voteLabel)
    }
    
    private func addPercent(){
        mainContentView.addSubview(percentageView)
        percentageView.horizontalToSuperview(insets: .horizontal(16))
        percentageView.topToBottom(of: contentStack,offset: 8)
    }
    
    private func addButtonStack(){
        contentView.addSubview(buttonStack)
        buttonStack.horizontalToSuperview(insets: .horizontal(16))
        buttonStack.topToBottom(of: mainContentView,offset: 8)
        //items
        buttonStack.addArrangedSubview(agreeButton)
        buttonStack.addArrangedSubview(dissagreeButton)
    }
    
}


//  MARK: - Action
extension AllSurveyCell{
    
    func updatePercentage(voteCount: Int, voterCount: Int) {
        guard voterCount > 0 else {
            percentageView.setProgress(0.0, animated: true)
            return
        }
        
        let percentage = Float(voteCount) / Float(voterCount)
        percentageView.setProgress(percentage, animated: true)
    }
    
    @objc
    private func agreeButtonTapped(){
        guard let delegate = delegate else { return  }
        guard let indexPath = indexPath else { return  }
        delegate.agreeButtonTapped(indexPath:indexPath)
    }
    
    @objc
    private func disagreeButtonTapped(){
        guard let delegate = delegate else { return  }
        guard let indexPath = indexPath else { return  }
        delegate.dissAgreeButtonTapped(indexPath:indexPath)
    }
    
}
