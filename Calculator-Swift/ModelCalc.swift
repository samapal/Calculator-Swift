//
//  ModelCalc.swift
//  Calculator-Swift
//
//  Created by Dmitry Faddeev on 16/05/16.
//  Copyright © 2016 Vladimir Nefedov. All rights reserved.
//

import Foundation

class CalculatorImpimantation {
    
    private var accumulator:Double = 0.0
    
    func setOperand (operand:Double){
       accumulator = operand
    }
    func perfomOperation (symbol: String){
        switch symbol {
          case "Pi": accumulator = M_PI
          case "√": accumulator = sqrt(accumulator)
        default: break
        }
        
    }
    
    var result : Double {
        get{
            return accumulator
        }
        
    }
}