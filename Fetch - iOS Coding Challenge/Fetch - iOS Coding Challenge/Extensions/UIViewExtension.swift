//
//  UIViewExtension.swift
//  Fetch - iOS Coding Challenge
//
//  Created by Junaid Zaidi on 7/3/23.
//

import UIKit

extension UIView {
    private static var activityIndicatorTag: Int { return 9876 }
    
    func showActivityIndicator(style: UIActivityIndicatorView.Style = .medium) {
        guard viewWithTag(UIView.activityIndicatorTag) == nil else { return }
        
        let activityIndicator = UIActivityIndicatorView(style: style)
        activityIndicator.tag = UIView.activityIndicatorTag
        activityIndicator.center = center
        activityIndicator.startAnimating()
        
        DispatchQueue.main.async {
            self.addSubview(activityIndicator)
        }
    }
    
    func hideActivityIndicator() {
        guard let activityIndicator = viewWithTag(UIView.activityIndicatorTag) as? UIActivityIndicatorView else { return }
        
        DispatchQueue.main.async {
            activityIndicator.stopAnimating()
            activityIndicator.removeFromSuperview()
        }
    }
}
