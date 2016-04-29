//
//  ViewController.swift
//  Calculator-Swift
//
//  Created by Dmitry Faddeev on 29/04/16.
//  Copyright © 2016 Vladimir Nefedov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func pressButton(sender: UIButton) {
        let digit = sender.currentTitle!
        print("touched \(digit) button")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

