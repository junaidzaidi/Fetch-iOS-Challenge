//
//  UIImageViewExtension.swift
//  Fetch - iOS Coding Challenge
//
//  Created by Junaid Zaidi on 7/3/23.
//

import UIKit

extension UIImageView {
    
    private static var imageCache = NSCache<NSString, UIImage>()
    func loadImage(from url: URL, placeholder: UIImage? = nil) {
        
        let activityIndicator = activityIndicator
        
        // Set placeholder image if provided
        if let placeholder = placeholder {
            image = placeholder
        }
        
        // Check if image is available in cache
        if let cachedImage = UIImageView.imageCache.object(forKey: url.absoluteString as NSString) {
            image = cachedImage
            return
        }
        
        DispatchQueue.main.async {
            activityIndicator.startAnimating()
        }
        // Download image asynchronously
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            
            DispatchQueue.main.async {
                activityIndicator.stopAnimating()
            }
            guard let data = data,
                  let downloadedImage = UIImage(data: data) else {
                self?.image = UIImage(named: "\(Assets.noPlaceholder.rawValue)")
                        return
            }
            
            // Cache the downloaded image
            UIImageView.imageCache.setObject(downloadedImage, forKey: url.absoluteString as NSString)
            
            // Set the image on the main thread
            DispatchQueue.main.async {
                self?.image = downloadedImage
            }
        }.resume()
    }
    
    //// Returns activity indicator view centrally aligned inside the UIImageView
    private var activityIndicator: UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.hidesWhenStopped = true
        activityIndicator.color = UIColor.black
        self.addSubview(activityIndicator)

        activityIndicator.translatesAutoresizingMaskIntoConstraints = false

        let centerX = NSLayoutConstraint(item: self,
                                         attribute: .centerX,
                                         relatedBy: .equal,
                                         toItem: activityIndicator,
                                         attribute: .centerX,
                                         multiplier: 1,
                                         constant: Constants.constraintZero)
        let centerY = NSLayoutConstraint(item: self,
                                         attribute: .centerY,
                                         relatedBy: .equal,
                                         toItem: activityIndicator,
                                         attribute: .centerY,
                                         multiplier: 1,
                                         constant: Constants.constraintZero)
        self.addConstraints([centerX, centerY])
        return activityIndicator
    }
}

