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
    private let webMainView = WebMainView()
    
    //MARK: - Lyfecycle
    override func loadView() {
        view = webMainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webMainView.webView.navigationDelegate = self
        configureButtonActions()
        loadMainWebPage()
    }
    
    //MARK: - Private Methods
    private func configureButtonActions() {
        webMainView.previousPageButton.action = #selector(previousPageButtonPressed)
        webMainView.mainPageButton.action = #selector(mainPageButtonPressed)
        webMainView.nextPageButton.action = #selector(nextPageButtonPressed)
    }
    
    private func loadMainWebPage() {
        guard let url = Configurator.url else { return }
        let urlRequest = URLRequest(url: url)
        webMainView.webView.load(urlRequest)
    }
    
    //MARK: - Actions
    @objc private func previousPageButtonPressed() {
        if webMainView.previousPageButton.isEnabled {
            webMainView.webView.goBack()
        }
    }
    
    @objc private func mainPageButtonPressed() {
        loadMainWebPage()
    }
    
    @objc private func nextPageButtonPressed() {
        if webMainView.nextPageButton.isEnabled {
            webMainView.webView.goForward()
        }
    }
}

extension WebViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        webMainView.previousPageButton.isEnabled = webView.backForwardList.backList.isEmpty ? false : true
        webMainView.nextPageButton.isEnabled = webView.backForwardList.forwardList.isEmpty ? false : true
    }
}

