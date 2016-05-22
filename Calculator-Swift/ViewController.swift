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
    private var isDotPressed = false
    
    var savedProgram:CalculatorImplimantation.PropertyList?
    

    @IBAction func ExtractFromMemory(sender: AnyObject) {
        displayValue = calculator.memory
    }

    @IBAction func AddToMemory() {
        calculator.memory = displayValue
        print(calculator.memory)
        
    }
    @IBAction func SaveToX(sender: UIButton) {
        if let variable = sender.currentTitle {
            calculator.setOperand(displayValue)
            calculator.setOperand(variable)
        }
    }
    @IBAction func Clear() {
        calculator.clear()
        displayValue = calculator.result
        isTheMiddleTyping = false
        
    }
    @IBAction func Save() {
        savedProgram = calculator.program
    }
    
    @IBAction func restore() {
        if savedProgram != nil {
            calculator.program = savedProgram!
            displayValue = calculator.result
        }
    }
    
    @IBOutlet private weak var calcdisplay: UILabel!
    
    @IBAction private func pressButton(sender: UIButton) {
        let digit = sender.currentTitle!
        print("touched \(digit) button")
        let temporarydigit = calcdisplay.text!

        if isTheMiddleTyping {
            calcdisplay.text = temporarydigit + digit
           
            if (digit==".") {
                
                if isDotPressed {
                   calcdisplay.text = temporarydigit
                }
                isDotPressed=true
            
              }
        }
        else {
            if (digit == ".") {
                isDotPressed = true
                calcdisplay.text = "0."}
            else {
                calcdisplay.text = digit}
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
    
    private var calculator:CalculatorImplimantation = CalculatorImplimantation()
    
    
    @IBAction private func launchOperation(sender: AnyObject) {
        if isTheMiddleTyping {
            calculator.setOperand(displayValue)
        }
        if let operation = sender.currentTitle {
         calculator.perfomOperation(operation!)
          displayValue = calculator.result
        }
        isTheMiddleTyping = false
        isDotPressed=false
            
        
    }


}

