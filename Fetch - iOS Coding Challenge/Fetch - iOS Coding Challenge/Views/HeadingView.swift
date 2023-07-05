//
//  HeadingView.swift
//  Fetch - iOS Coding Challenge
//
//  Created by Junaid Zaidi on 7/3/23.
//

import Foundation
import UIKit

/*  View for Headings
 
    Accepts Title and Section Color(Optional)
*/
class HeadingView: UIView {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: FontSize.heading)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    init(title: String, sectionColor: UIColor? = nil) {
        super.init(frame: .zero)
        titleLabel.text = title
        backgroundColor = sectionColor
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("\(ErrorStrings.coderNotImplemented.rawValue)")
    }
    
    private func setupLayout() {
        
        addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: Constants.topConstraint),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: Constants.bottomConstraint),
            
        ])
    }
}

