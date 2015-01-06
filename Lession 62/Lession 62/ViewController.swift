//
//  ViewController.swift
//  Lession 62
//
//  Created by Astin on 12/23/14.
//  Copyright (c) 2014 Astin. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var nameField: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepareForSegue(segue: NSStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "DetailSegue" {
            (segue.destinationController as NSViewController).representedObject = nameField.stringValue
        }
    }

//    override var representedObject: AnyObject? {
//        didSet {
//        // Update the view, if already loaded.
//        }
//    }


}

