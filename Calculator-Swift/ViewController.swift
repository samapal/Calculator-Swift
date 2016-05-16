//
//  ViewController.swift
//  Calculator-Swift
//
//  Created by Dmitry Faddeev on 29/04/16.
//  Copyright © 2016 Vladimir Nefedov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var isTheMiddleTyping = false
    
    @IBOutlet private weak var calcdisplay: UILabel!
    
    @IBAction private func pressButton(sender: UIButton) {
        let digit = sender.currentTitle!
        print("touched \(digit) button")
        let temporarydigit = calcdisplay.text!
        if isTheMiddleTyping {
            calcdisplay.text = temporarydigit + digit
        }
        else {
             calcdisplay.text = digit
        }
        
        isTheMiddleTyping = true

        
    }
    
    private var displayValue : Double {
        get {
            return Double(calcdisplay.text!)!
        }
        set {
            calcdisplay.text = String(newValue)
            
        }
    }
    
    private var calculator:CalculatorImpimantation = CalculatorImpimantation()
    
    
    @IBAction private func launchOperation(sender: AnyObject) {
        if isTheMiddleTyping {
            calculator.setOperand(displayValue)
        }
        if let operation = sender.currentTitle {
         calculator.perfomOperation(operation!)
          displayValue = calculator.result
        }
        isTheMiddleTyping = false
            
        
    }


}

