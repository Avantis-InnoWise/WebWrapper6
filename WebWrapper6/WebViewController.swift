//
//  WebViewController.swift
//  WebWrapper6
//
//  Created by user on 14.04.22.
//

import Cocoa

class WebViewController: NSViewController {
    //MARK: - Properties
    private let mainView = WebMainView()

    //MARK: - Lyfe Cycle
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    //MARK: - Private Methods
    private func configureView() {
        setupSubviews()
        setupLayout()
    }
    
    private func setupSubviews() {}
    private func setupLayout() {}

    //MARK: - Actions
}
