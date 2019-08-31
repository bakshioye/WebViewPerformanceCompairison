//
//  WebViewViewController.swift
//  WebViewPerformanceCompairison
//
//  Created by Shubham Bakshi on 31/08/19.
//  Copyright © 2019 Shubham Bakshi. All rights reserved.
//

import UIKit
import WebKit

class WebViewViewController: UIViewController {
    
    
    var uiWebView: UIWebView!
    var wkWebView: WKWebView!
    
    var webViewType: WebViewType!
    
    var url: URLRequest {
        let url = URL(string: "https://www.google.com")!
        return URLRequest(url: url)
    }
    
    // MARK: - ViewController lifecycle methods
    override func viewDidLoad() {
    
        webViewType == WebViewType.UIWebView ? makeUIWebView() : makeWKWebView()
        
    }

}

// MARK: - Helper Methods
extension WebViewViewController {
    
    func makeUIWebView() {
        
        uiWebView = UIWebView(frame: view.frame)
        
        view.addSubview(uiWebView)
        
        uiWebView.loadRequest(url)
        
    }
    
    func makeWKWebView() {
        
        wkWebView = WKWebView(frame: view.frame)
        
        view.addSubview(wkWebView)
        
        wkWebView.load(url)
        
    }
    
}


