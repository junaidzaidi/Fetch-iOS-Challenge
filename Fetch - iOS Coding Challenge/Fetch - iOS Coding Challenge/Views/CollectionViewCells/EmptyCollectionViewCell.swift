//
//  EmptyCollectionViewCell.swift
//  Fetch - iOS Coding Challenge
//
//  Created by Junaid Zaidi on 7/4/23.
//

import UIKit

class EmptyCollectionViewCell: UICollectionViewCell {
    private let textLabel: UILabel
    
    override init(frame: CGRect) {
        
        self.textLabel = UILabel()
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("\(ErrorStrings.coderNotImplemented.rawValue)")
    }
    
    private func setupUI() {
        
        setTextLabel()
    }
    
    private func setTextLabel() {
        
        contentView.addSubview(textLabel)
        
        // Configure name label
        textLabel.font = UIFont.systemFont(ofSize: FontSize.description, weight: .semibold)
        textLabel.textAlignment = .center
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.numberOfLines = 2
        textLabel.text = ErrorStrings.errorMealList.rawValue
        
        // Configure layout constraints
        NSLayoutConstraint.activate([
            textLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            textLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.leadingConstraint),
            textLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: Constants.trailingConstraint),
            textLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
}
