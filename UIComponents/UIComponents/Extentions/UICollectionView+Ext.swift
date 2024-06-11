//
//  UICollectionView+Ext.swift
//  UIComponents
//
//  Created by kingSemih on 11.06.2024.
//

import Foundation
import UIKit
import TinyConstraints

public extension UICollectionView {
    
    func register<T: UICollectionViewCell>(_: T.Type) where T: ReusableView {
        register(T.self, forCellWithReuseIdentifier: T.reuseIdentifier)
    }
    
    func registerHeader<T: UICollectionReusableView>(_: T.Type) where T: ReusableView {
        register(T.self,
                 forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                 withReuseIdentifier: T.reuseIdentifier)
    }
    
    func registerFooter<T: UICollectionReusableView>(_: T.Type) where T: ReusableView {
        register(T.self,
                 forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
                 withReuseIdentifier: T.reuseIdentifier)
    }
    
    // swiftlint:disable fatal_error
    func dequeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T where T: ReusableView {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        return cell
    }
    
    func dequeueReusableCell<T: UICollectionReusableView>(ofKind: String, for indexPath: IndexPath) -> T where T: ReusableView {
        guard let cell = dequeueReusableSupplementaryView(ofKind: ofKind, withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
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
        
        let button:UIButton = {
            let button = UIButton()
            button.setTitle(buttonTitle, for: .normal)
            button.backgroundColor = .blue
            button.setTitleColor(.white, for: .normal)
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
