//
//  AkamToolManager.swift
//  AkamTool
//
//  Created by Astin on 1/29/15.
//  Copyright (c) 2015 Astin. All rights reserved.
//

import AppKit

private let _sharedInstance = AkamToolManager()

class AkamToolManager: NSObject {
    
    let statusItem = NSStatusBar.systemStatusBar().statusItemWithLength(-1) // NSVariableStatusItemLength
    let popover = NSPopover()
    let mainMenu = NSMenu()

    let contentViewController = ContentViewController()
//    let preferenceWindowController = PreferenceWindowController()
//    let aboutWindowController = AboutWindowController()
    
    class func sharedInstance() -> AkamToolManager {
        return _sharedInstance
    }
    
    override init() {
        super.init()

        let editMenu = NSMenu(title: "Edit")
        let editMenuItem = NSMenuItem(title: "Copy", action: "copy:", keyEquivalent: "c")

        self.mainMenu.addItem(editMenuItem)
        self.mainMenu.setSubmenu(editMenu, forItem:editMenuItem)
        
        NSApplication.sharedApplication().mainMenu = mainMenu
        
        //
        let icon = NSImage(named: "statusicon_default")
        icon?.setTemplate(true)
        self.statusItem.image = icon
        self.statusItem.target = self
        self.statusItem.action = "open"
        
        let button = self.statusItem.valueForKey("_button") as NSButton
        button.focusRingType = .None
        button.setButtonType(.PushOnPushOffButton)
        
        self.popover.contentViewController = self.contentViewController
        
        NSEvent.addGlobalMonitorForEventsMatchingMask(.LeftMouseUpMask | .LeftMouseDownMask, handler: { event in
            self.close()
        })
        
        NSEvent.addLocalMonitorForEventsMatchingMask(.KeyDownMask, handler: { (event) -> NSEvent in
            self.handleKeyCode(event.keyCode, flags: event.modifierFlags, windowNumber: event.windowNumber)
            return event
        })
        
    }
    
    func open() {
        if self.popover.shown {
            self.close()
            return
        }
        
        let button = self.statusItem.valueForKey("_button") as NSButton
        button.state = NSOnState
        
        NSApp.activateIgnoringOtherApps(true)
        self.popover.showRelativeToRect(NSZeroRect, ofView: button, preferredEdge: NSMaxYEdge)
        self.contentViewController.updateHotKeyLabel()
//        self.contentViewController.focusOnTextArea()
//
//        AnalyticsHelper.sharedInstance().recordScreenWithName("AllkdicWindow")
//        AnalyticsHelper.sharedInstance().recordCachedEventWithCategory(
//            AnalyticsCategory.Allkdic,
//            action: AnalyticsAction.Open,
//            label: nil,
//            value: nil
//        )
    }
    
    func close() {
        if !self.popover.shown {
            return
        }
        
        let button = self.statusItem.valueForKey("_button") as NSButton
        button.state = NSOffState
        
        self.popover.close()
        
//        AnalyticsHelper.sharedInstance().recordCachedEventWithCategory(
//            AnalyticsCategory.Allkdic,
//            action: AnalyticsAction.Close,
//            label: nil,
//            value: nil
//        )
    }
    
    func handleKeyCode(keyCode: UInt16, flags: NSEventModifierFlags, windowNumber: Int) {
        let keyBinding = KeyBinding(keyCode: Int(keyCode), flags: Int(flags.rawValue))
        
        let window = NSApp.windowWithWindowNumber(windowNumber)
        if window? == nil {
            return
        }
        
        if window!.dynamicType.className() == "NSStatusBarWindow" {
            self.contentViewController.handleKeyBinding(keyBinding)
        }
//        else if window!.windowController()? != nil && window!.windowController()! is PreferenceWindowController {
//            window!.windowController()!.handleKeyBinding(keyBinding)
//        }
    }
}

