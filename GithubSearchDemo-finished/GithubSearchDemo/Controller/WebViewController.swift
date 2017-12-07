//
//  WebViewController.swift
//  GithubSearchDemo
//
//  Created by Nathan on 06/12/2017.
//  Copyright © 2017 Nathan. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    /// LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.delegate = self
        webView?.scalesPageToFit = true
        loadURL()
    }
    
    var activeDownloads = 0
    
    var webUrl: URL? = nil{
        didSet{
            if webView?.window != nil{
                loadURL()
            }
        }
    }
    
    private func loadURL() {
        if webUrl != nil {
            let request = URLRequest(url: webUrl!)
            spinner.startAnimating()
            webView?.loadRequest(request)
        }
    }
}

extension WebViewController: UIWebViewDelegate {
    func webViewDidStartLoad(_ webView: UIWebView) {
        activeDownloads += 1
        spinner.startAnimating()
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        activeDownloads -= 1
        if activeDownloads < 1 {
            spinner.stopAnimating()
        }
    }
}
