//
//  UITableView+Ext.swift
//  UIComponents
//
//  Created by kingSemih on 11.06.2024.
//

import Foundation
import UIKit
import TinyConstraints

// swiftlint:disable fatal_error
public extension UITableView {
    
    func register<T: UITableViewCell>(_: T.Type) where T: ReusableView {
        register(T.self, forCellReuseIdentifier: T.reuseIdentifier)
    }
    
    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T where T: ReusableView {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        return cell
    }
    
    func dequeueReusableCell<T: UITableViewCell>() -> T where T: ReusableView {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        return cell
    }
    
    func registerHeaderFooter<T: UITableViewHeaderFooterView>(_: T.Type) where T: ReusableView {
        register(T.self, forHeaderFooterViewReuseIdentifier: T.reuseIdentifier)
    }
    
    func dequeueReusableHeaderFooter<T: UITableViewHeaderFooterView>() -> T where T: ReusableView {
        guard let cell = dequeueReusableHeaderFooterView(withIdentifier: T.reuseIdentifier) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        return cell
    }
    
    func setEmptyView(text: String, buttonTitle: String? = nil, target: Any? = nil, action: Selector? = nil, multiplier: CGFloat = 1) {
        
        let containerView = {
            let view = UIView()
            return view
        }()
        
        let titleLabel = {
            let label = UILabel()
            label.text = text
            label.font = .systemFont(ofSize: 18)
            label.textColor = .black
            label.numberOfLines = 0
            return label
        }()
       
        let button = {
            let button = UIButton()
            button.setTitle(buttonTitle, for: .normal)
            button.backgroundColor = .black
            button.layer.cornerRadius = 8
            return button
        }()
        
        let stackView = {
            let stack = UIStackView()
            stack.axis = .vertical
            stack.spacing = 16
            return stack
        }()
        
        containerView.size(bounds.size)
        containerView.addSubview(stackView)
        
        stackView.addArrangedSubview(titleLabel)
        if buttonTitle != nil {
            if let action = action {
                button.addTarget(target, action: action, for: .touchUpInside)
            }
            button.height(48)
            stackView.addArrangedSubview(button)
        }
        
        stackView.centerYToSuperview(multiplier: multiplier)
        stackView.horizontalToSuperview(insets: .horizontal(24))
        
        backgroundView = containerView
    }
    
    func restore() {
        backgroundView = nil
    }
}
// swiftlint:enable fatal_error

public extension UITableViewCell {
    
    func addCustomDisclosureIndicator(with color: UIColor) {
        accessoryType = .disclosureIndicator
        let disclosureImage = UIImage(systemName: "chevron.right")?.withRenderingMode(.alwaysTemplate)
        let imageWidth = (disclosureImage?.size.width) ?? 7
        let imageHeight = (disclosureImage?.size.height) ?? 12
        let accessoryImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: imageWidth, height: imageHeight))
        accessoryImageView.contentMode = .scaleAspectFit
        accessoryImageView.image = disclosureImage
        accessoryImageView.tintColor = color
        accessoryView = accessoryImageView
    }
}
