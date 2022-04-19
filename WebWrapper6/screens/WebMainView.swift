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
    
    var containerBoxView: NSBox = {
        let container = NSBox()
        container.boxType = .custom
        container.title = String.empty
        return container.allowAutoLayout()
    }()
    
    var previousPageButton: NSButton = {
        let button = NSButton()
        button.title = "PreviousPageButtonTitle".localizedString
        button.isEnabled = false
        button.layer?.backgroundColor = CGColor.white
        return button.allowAutoLayout()
    }()
    
    var mainPageButton: NSButton = {
        let button = NSButton()
        button.title = "MainPageButtonTitle".localizedString
        button.layer?.backgroundColor = CGColor.white
        return button.allowAutoLayout()
    }()
    
    var nextPageButton: NSButton = {
        let button = NSButton()
        button.isEnabled = false
        button.title = "NextPageButtonTitle".localizedString
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
        configureMainView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private Methods
    private func configureMainView() {
        configureSubviews()
        configureConstraints()
    }
    
    private func configureSubviews() {
        addSubview(webView)
        addSubview(containerBoxView)
        containerBoxView.addSubview(previousPageButton)
        containerBoxView.addSubview(mainPageButton)
        containerBoxView.addSubview(nextPageButton)
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            webView.centerXAnchor.constraint(equalTo: centerXAnchor),
            webView.widthAnchor.constraint(equalTo: widthAnchor),
            webView.bottomAnchor.constraint(equalTo: bottomAnchor),
            webView.topAnchor.constraint(equalTo: containerBoxView.bottomAnchor),
            
            containerBoxView.widthAnchor.constraint(equalTo: widthAnchor),
            containerBoxView.heightAnchor.constraint(equalToConstant: 70),
            containerBoxView.topAnchor.constraint(equalTo: topAnchor),
            containerBoxView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            previousPageButton.widthAnchor.constraint(equalToConstant: 80),
            previousPageButton.heightAnchor.constraint(equalToConstant: 30),
            previousPageButton.centerYAnchor.constraint(equalTo: containerBoxView.centerYAnchor),
            previousPageButton.leftAnchor.constraint(equalTo: containerBoxView.leftAnchor, constant: 30),
            
            mainPageButton.widthAnchor.constraint(equalToConstant: 120),
            mainPageButton.heightAnchor.constraint(equalToConstant: 30),
            mainPageButton.centerXAnchor.constraint(equalTo: containerBoxView.centerXAnchor),
            mainPageButton.centerYAnchor.constraint(equalTo: containerBoxView.centerYAnchor),
            
            nextPageButton.widthAnchor.constraint(equalToConstant: 80),
            nextPageButton.heightAnchor.constraint(equalToConstant: 30),
            nextPageButton.centerYAnchor.constraint(equalTo: containerBoxView.centerYAnchor),
            nextPageButton.rightAnchor.constraint(equalTo: containerBoxView.rightAnchor, constant: -30)
        ])
    }
}
