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
    
    var operations:Dictionary<String,Operation> = [
     "Pi": Operation.Constant(M_PI),
     "e" : Operation.Constant(M_E),
     "√" : Operation.UnaryOperation(sqrt),
     "cos": Operation.UnaryOperation(cos)
    ]
    
    enum Operation {
        case Constant(Double)
        case UnaryOperation((Double)->Double)
        case BinaryOperation
        case Equals
        
    }
    
    func perfomOperation (symbol: String){
        
        if let oper = operations[symbol]{
            switch oper {
            case .Constant(let assotiatedValue): accumulator = assotiatedValue
            case .UnaryOperation(let unaryfunc): accumulator = 
            case .BinaryOperation: break
            case .Equals: break
            }
        }

        
        
    }
    
    var result : Double {
        get{
            return accumulator
        }
        
    }
}