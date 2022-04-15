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
    //MARK: - Initialization
    override init(frame frameRect: NSRect) {
        var frame: CGRect {
            if let frame = NSScreen.main?.frame {
                return frame
            } else {
                return .zero
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
    private func configureView() {}
}
