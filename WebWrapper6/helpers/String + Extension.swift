//
//  String + Extension.swift
//  WebWrapper6
//
//  Created by user on 15.04.22.
//

import Foundation

extension String {
    var localizedString: String {
        NSLocalizedString(self, comment: "")
    }
    
    static var empty: String {
        return ""
    }
}
