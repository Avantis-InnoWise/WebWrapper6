//
//  WebViewController.swift
//  WebWrapper6
//
//  Created by user on 14.04.22.
//

import Cocoa
import WebKit

final class WebViewController: NSViewController {
    //MARK: - Properties
    private let mainView = WebMainView()
    
    //MARK: - Lyfecycle
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.webView.navigationDelegate = self
        setupButtonActions()
        loadWebPage()
    }
    
    //MARK: - Private Methods
    private func setupButtonActions() {
        mainView.backButton.action = #selector(backButtonPressed)
        mainView.homeButton.action = #selector(homeButtonPressed)
        mainView.nextButton.action = #selector(nextButtonPressed)
    }
    
    private func loadWebPage() {
        guard let url = Configurator.url else { return }
        let urlRequest = URLRequest(url: url)
        mainView.webView.load(urlRequest)
    }
    
    //MARK: - Actions
    @objc private func backButtonPressed() {
        if mainView.backButton.isEnabled {
            mainView.webView.goBack()
        }
    }
    
    @objc private func homeButtonPressed() {
        loadWebPage()
    }
    
    @objc private func nextButtonPressed() {
        if mainView.nextButton.isEnabled {
            mainView.webView.goForward()
        }
    }
}

extension WebViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        mainView.backButton.isEnabled = webView.backForwardList.backList.isEmpty ? false : true
        mainView.nextButton.isEnabled = webView.backForwardList.forwardList.isEmpty ? false : true
    }
}

