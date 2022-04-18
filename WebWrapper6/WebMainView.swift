//
//  WebMainView.swift
//  WebWrapper6
//
//  Created by user on 15.04.22.
//

import Cocoa
import WebKit

final class WebMainView: NSView {
    //MARK: - UI Properties
    var webView: WKWebView = {
        let preferences = WKPreferences()
        preferences.javaScriptEnabled = true
        let configuration = WKWebViewConfiguration()
        configuration.preferences = preferences
        let webView = WKWebView(frame: .zero, configuration: configuration)
        return webView.allowAutoLayout()
    }()
    
    var containerView: NSBox = {
        let container = NSBox()
        container.boxType = .custom
        container.title = String.empty
        return container.allowAutoLayout()
    }()
    
    var backButton: NSButton = {
        let button = NSButton()
        button.title = "BackButtonTitle".localizedString
        button.isEnabled = false
        button.layer?.backgroundColor = CGColor.white
        return button.allowAutoLayout()
    }()
    
    var homeButton: NSButton = {
        let button = NSButton()
        button.title = "HomePageButtonTitle".localizedString
        button.layer?.backgroundColor = CGColor.white
        return button.allowAutoLayout()
    }()
    
    var nextButton: NSButton = {
        let button = NSButton()
        button.isEnabled = false
        button.title = "NextButtonTitle".localizedString
        button.layer?.backgroundColor = CGColor.white
        return button.allowAutoLayout()
    }()
    
    //MARK: - Initialization
    override init(frame frameRect: NSRect) {
        var frame: CGRect {
            if let frame = NSScreen.main?.frame {
                return frame
            } else {
                return frameRect
            }
        }
        
        super.init(frame: frame)
        configureView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private Methods
    private func configureView() {
        setupSubviews()
        setupLayout()
    }
    
    private func setupSubviews() {
        addSubview(webView)
        addSubview(containerView)
        containerView.addSubview(backButton)
        containerView.addSubview(homeButton)
        containerView.addSubview(nextButton)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            webView.centerXAnchor.constraint(equalTo: centerXAnchor),
            webView.widthAnchor.constraint(equalTo: widthAnchor),
            webView.bottomAnchor.constraint(equalTo: bottomAnchor),
            webView.topAnchor.constraint(equalTo: containerView.bottomAnchor),
            
            containerView.widthAnchor.constraint(equalTo: widthAnchor),
            containerView.heightAnchor.constraint(equalToConstant: 70),
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            backButton.widthAnchor.constraint(equalToConstant: 80),
            backButton.heightAnchor.constraint(equalToConstant: 30),
            backButton.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            backButton.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 30),
            
            homeButton.widthAnchor.constraint(equalToConstant: 120),
            homeButton.heightAnchor.constraint(equalToConstant: 30),
            homeButton.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            homeButton.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            
            nextButton.widthAnchor.constraint(equalToConstant: 80),
            nextButton.heightAnchor.constraint(equalToConstant: 30),
            nextButton.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            nextButton.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -30)
        ])
    }
}

