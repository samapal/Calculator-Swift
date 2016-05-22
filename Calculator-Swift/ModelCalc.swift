//
//  ModelCalc.swift
//  Calculator-Swift
//
//  Created by Dmitry Faddeev on 16/05/16.
//  Copyright © 2016 Vladimir Nefedov. All rights reserved.
//

import Foundation

class CalculatorImplimantation {
    private var internalProgram = [AnyObject]()
    private var accumulator:Double = 0.0
    
    func setOperand (operand:Double){
       accumulator = operand
        internalProgram.append(operand)
    }
    
    var operations:Dictionary<String,Operation> = [
     "Pi": Operation.Constant(M_PI),
     "e" : Operation.Constant(M_E),
     "√" : Operation.UnaryOperation(sqrt),
     "cos": Operation.UnaryOperation(cos),
     "C": Operation.Constant(0.0),
     "±": Operation.UnaryOperation({-$0}),
     "×": Operation.BinaryOperation({$0*$1}),
     "−": Operation.BinaryOperation({ $0-$1 }),
     "÷": Operation.BinaryOperation({$0/$1}),
     "+": Operation.BinaryOperation({$0+$1}),
     "=": Operation.Equals,
     "%": Operation.UnaryOperation({$0/100}),
     "sin": Operation.UnaryOperation(sin)
    ]
    
    enum Operation {
        case Constant(Double)
        case UnaryOperation((Double)->Double)
        case BinaryOperation((Double, Double)->Double)
        case Equals
        
    }
    

    
    func perfomOperation (symbol: String){
        internalProgram.append(symbol)
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
    
    typealias PropertyList = AnyObject
    
    var program:PropertyList {
        get {
            return internalProgram
        }
        set {
            clear()
            if let arrayOfOps = newValue as? [AnyObject]{
                for op in arrayOfOps {
                    if let operand = op as? Double {
                        setOperand(operand)
                    } else if let operation = op as? String {
                        perfomOperation(operation)
                    }
                }
            }
        }
    }
    
    private func clear(){
        accumulator=0.0
        pending = nil
        internalProgram.removeAll()
    }
    
    var result : Double {
        get{
            return accumulator
        }
        
    }
}