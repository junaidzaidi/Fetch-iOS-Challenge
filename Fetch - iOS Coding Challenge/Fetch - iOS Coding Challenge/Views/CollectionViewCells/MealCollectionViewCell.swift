//
//  RecipeCollectionViewCell.swift
//  Fetch - iOS Coding Challenge
//
//  Created by Junaid Zaidi on 7/3/23.
//

import UIKit

/*
    Collection View Cell used in Meal List 
 */


class MealCollectionViewCell: UICollectionViewCell {
    private let imageView: UIImageView
    private let nameLabel: UILabel
    
    override init(frame: CGRect) {
        self.imageView = UIImageView()
        self.nameLabel = UILabel()
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("\(ErrorStrings.coderNotImplemented.rawValue)")
    }
    
    private func setupUI() {
        
        setNameLabel()
        setImageView()
    }
    
    private func setNameLabel() {
        
        contentView.addSubview(nameLabel)
        
        // Configure name label
        nameLabel.font = UIFont.systemFont(ofSize: FontSize.description, weight: .semibold)
        nameLabel.textAlignment = .center
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.numberOfLines = 2
        
        // Configure layout constraints
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.leadingConstraint),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: Constants.trailingConstraint),
            nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    private func setImageView() {
        
        contentView.addSubview(imageView)
        
        // Configure image view
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = Constants.cornerRadius
        imageView.clipsToBounds = true
        
        
        // Configure layout constraints
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.constraintZero),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.leadingConstraint),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: Constants.trailingConstraint),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor),
            imageView.bottomAnchor.constraint(equalTo: nameLabel.topAnchor, constant: Constants.bottomConstraint)
        ])
        
    }
    
    func configure(with meal: MealsItem) {
        nameLabel.text = meal.name
        if let thumbnail = meal.image,
           let url = URL(string: thumbnail) {
            imageView.loadImage(from: url)
        }
    }
}
