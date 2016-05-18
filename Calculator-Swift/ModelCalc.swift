//
//  ModelCalc.swift
//  Calculator-Swift
//
//  Created by Dmitry Faddeev on 16/05/16.
//  Copyright © 2016 Vladimir Nefedov. All rights reserved.
//

import Foundation
private func multiply(op1:Double, op2:Double)->Double{
    return op1*op2
}

private func minus(op1:Double, op2:Double)->Double{
    return op1-op2
}
private func divide(op1:Double, op2:Double)->Double{
    return op1/op2
}

private func plus(op1:Double, op2:Double)->Double{
    return op1+op2
}



class CalculatorImpimantation {

    private var accumulator:Double = 0.0
    
    func setOperand (operand:Double){
       accumulator = operand
    }
    
    var operations:Dictionary<String,Operation> = [
     "Pi": Operation.Constant(M_PI),
     "e" : Operation.Constant(M_E),
     "√" : Operation.UnaryOperation(sqrt),
     "cos": Operation.UnaryOperation(cos),
     "C": Operation.Constant(0.0),
     "×": Operation.BinaryOperation(multiply),
     "−": Operation.BinaryOperation(minus),
     "÷": Operation.BinaryOperation(divide),
     "+": Operation.BinaryOperation(plus),
     "=": Operation.Equals
    ]
    
    enum Operation {
        case Constant(Double)
        case UnaryOperation((Double)->Double)
        case BinaryOperation((Double, Double)->Double)
        case Equals
        
    }
    

    
    func perfomOperation (symbol: String){
        
        if let oper = operations[symbol]{
            switch oper {
            case .Constant(let value): accumulator = value
            case .UnaryOperation(let function): accumulator = function(accumulator)
            case .BinaryOperation(let function):
                 execPendingBinaryOperation()
                pending = PendingBinaryOperations(binaryfunction: function, firstOperand: accumulator)
            case .Equals:
                execPendingBinaryOperation()
            }
        }

        
        
    }
    
    private func execPendingBinaryOperation() {
        if pending != nil {
            accumulator = pending!.binaryfunction(pending!.firstOperand,accumulator)
            pending = nil
        }
    }
    
    private var pending:PendingBinaryOperations?
    
    
    struct PendingBinaryOperations {
        var binaryfunction:(Double, Double)->Double
        var firstOperand: Double
        
    }
    
    var result : Double {
        get{
            return accumulator
        }
        
    }
}