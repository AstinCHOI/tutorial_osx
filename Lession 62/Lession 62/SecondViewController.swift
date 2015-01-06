//
//  SecondViewController.swift
//  Lession 62
//
//  Created by Astin on 12/23/14.
//  Copyright (c) 2014 Astin. All rights reserved.
//

import Cocoa

class SecondViewController: NSViewController {

    @IBOutlet weak var nameLabel: NSTextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.stringValue = representedObject as String
    }
    
}
