//
//  WebPlayerView.swift
//  Fetch - iOS Coding Challenge
//
//  Created by Junaid Zaidi on 7/3/23.
//

import UIKit
import WebKit

/*
    View to embed WKWebView for playing youtube
    Accepts URL in initializer for the link to be played.
*/

class WebPlayerView: UIView {

    var webPlayer: WKWebView = {
        let webConfiguration = WKWebViewConfiguration()
        webConfiguration.allowsInlineMediaPlayback = true
        let webPlayer = WKWebView(frame: CGRect(x: Constants.constraintZero, y: Constants.constraintZero, width: Constants.constraintZero, height: Constants.constraintZero), configuration: webConfiguration)
        return webPlayer
    }()
    
    init(url: URL) {
        super.init(frame: .zero)
        
        addSubview(self.webPlayer)
        let request = URLRequest(url: url)
        webPlayer.load(request)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("\(ErrorStrings.coderNotImplemented.rawValue)")
    }
    
    private func setupLayout() {
        webPlayer.translatesAutoresizingMaskIntoConstraints = false


        NSLayoutConstraint.activate([
            webPlayer.topAnchor.constraint(equalTo: topAnchor),
            webPlayer.leadingAnchor.constraint(equalTo: leadingAnchor),
            webPlayer.trailingAnchor.constraint(equalTo: trailingAnchor),
            webPlayer.heightAnchor.constraint(equalToConstant: Constants.webPlayerHeight),
            webPlayer.bottomAnchor.constraint(equalTo: bottomAnchor),

        ])
    }
    
}
