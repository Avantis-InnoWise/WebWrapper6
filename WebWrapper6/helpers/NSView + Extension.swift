//
//  NSView + Extension.swift
//  WebWrapper6
//
//  Created by user on 15.04.22.
//

import Cocoa

extension NSView {
    @discardableResult
    func allowAutoLayout() -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        return self
    }
}
