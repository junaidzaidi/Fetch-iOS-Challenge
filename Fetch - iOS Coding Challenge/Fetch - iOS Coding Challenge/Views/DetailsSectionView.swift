//
//  DescriptionView.swift
//  Fetch - iOS Coding Challenge
//
//  Created by Junaid Zaidi on 7/3/23.
//

import UIKit

class DetailsSectionView: UIView {
    
    /*
        Contains a Heading and Description.
        Used for Description Sections in Meal Ingredients Screen
     
        Accepts Title, Section Color (Optional) and Description
    */
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    private var headingView: HeadingView?
    private var url: URL?
    
    init(title: String, titleSectionColor: UIColor? = nil, description: String) {
        super.init(frame: .zero)
        
        headingView = HeadingView(title: title, sectionColor: titleSectionColor)
        headingView?.translatesAutoresizingMaskIntoConstraints = false
        
        descriptionLabel.text = description

        setupLayout()
    }
    
    init(title: String, titleSectionColor: UIColor? = nil, descriptionAttributedText: NSAttributedString, url: URL) {
        super.init(frame: .zero)
        
        headingView = HeadingView(title: title, sectionColor: titleSectionColor)
        headingView?.translatesAutoresizingMaskIntoConstraints = false
        
        descriptionLabel.isUserInteractionEnabled = true
        descriptionLabel.attributedText = descriptionAttributedText
        
        self.url = url
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.labelTapped(_:)))
        descriptionLabel.addGestureRecognizer(tapGesture)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("\(ErrorStrings.coderNotImplemented.rawValue)")
    }
        
    private func setupLayout() {
        guard let headingView else { return }
        
        addSubview(headingView)
        addSubview(descriptionLabel)
        
        NSLayoutConstraint.activate([
            headingView.topAnchor.constraint(equalTo: topAnchor),
            headingView.leadingAnchor.constraint(equalTo: leadingAnchor),
            headingView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: headingView.bottomAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
            
        ])
    }
    
    @objc private func labelTapped(_ sender: UITapGestureRecognizer) {
        guard let url else { return }
        UIApplication.shared.open(url)
    }
}
