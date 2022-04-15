//
//  AppDelegate.swift
//  WebWrapper6
//
//  Created by user on 14.04.22.
//

import Cocoa

class AppDelegate: NSObject, NSApplicationDelegate {
    //MARK: - Properties
    private var window: NSWindow?

    //MARK: - Internal Methods
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        configureWindow()
    }

    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        return true
    }

    func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
        return true
    }
    
    //MARK: - Private Methods
    private func configureWindow() {
        guard let screenFrame = NSScreen.main?.frame else { return }
        let mask: NSWindow.StyleMask = [.miniaturizable, .closable, .resizable, .titled]
        
        window = NSWindow(
            contentRect: screenFrame,
            styleMask: mask,
            backing: .buffered,
            defer: false
        )
        
        window?.center()
        window?.makeKeyAndOrderFront(nil)
        window?.contentViewController = WebViewController()
    }
}

