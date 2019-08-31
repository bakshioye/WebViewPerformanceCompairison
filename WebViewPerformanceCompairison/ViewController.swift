//
//  ViewController.swift
//  WebViewPerformanceCompairison
//
//  Created by Shubham Bakshi on 31/08/19.
//  Copyright © 2019 Shubham Bakshi. All rights reserved.
//

import UIKit

enum WebViewType {
    case UIWebView
    case WKWebView
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialiseUI()
        
    }

}

// MARK: - Helper Methods
extension ViewController {
    
    private func initialiseUI() {

        let uiWebViewButton = UIButton(title: "UIWebView")
        uiWebViewButton.addTarget(self, action: #selector(openUIWebView), for: .touchUpInside)
        
        let wkWebViewButton = UIButton(title: "WKWebView")
        wkWebViewButton.addTarget(self, action: #selector(openWKWebView), for: .touchUpInside)
    
        let stackView = UIStackView(arrangedSubviews: [uiWebViewButton,wkWebViewButton])
        
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 15
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(stackView)
        
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
    }
    
    @objc func openUIWebView() {
        
        let viewControllerObject = self.storyboard?.instantiateViewController(withIdentifier: "webViewController") as! WebViewViewController
        
        viewControllerObject.webViewType = .UIWebView
        
        navigationController?.pushViewController(viewControllerObject, animated: true)
        
    }
    
    @objc func openWKWebView() {

        let viewControllerObject = self.storyboard?.instantiateViewController(withIdentifier: "webViewController") as! WebViewViewController
        
        viewControllerObject.webViewType = .WKWebView
        
        navigationController?.pushViewController(viewControllerObject, animated: true)

    }
}

extension UIButton {
    
    convenience init(title: String) {
        
        self.init(frame: CGRect(x: 0, y: 0, width: 50, height: 20))
        
        setTitle(title, for: .normal)
        setTitleColor(UIColor.white, for: .normal)
        backgroundColor = UIColor(red: 0.0, green: 122.0/255.0, blue: 255.0/255.0, alpha: 1.0)
        contentEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layer.cornerRadius = 5.0
        
    }
    
}

