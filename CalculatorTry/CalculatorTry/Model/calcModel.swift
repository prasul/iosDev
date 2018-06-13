//
//  calcModel.swift
//  CalculatorTry
//
//  Created by Prasul Surendran on 25/05/18.
//  Copyright © 2018 Prasul Surendran. All rights reserved.
//

import Foundation
class CalcModel {
    var firstNum : Double = 0
    var secondNum : Double = 0
    var finalAns : Double = 0
    var operatorVal : String = ""
    init() {
        
    }
    convenience init (numberOne : Double, numberTwo : Double, operation: String){
        self.init()
        firstNum = numberOne
        secondNum = numberTwo
        operatorVal = operation
    }
    func addNumbers () -> Double{
        finalAns = firstNum + secondNum
        print("adding the values \(firstNum) and \(secondNum) and the answer is \(finalAns)")
        return finalAns
    }
    func subtractNum () -> Double{
        finalAns = firstNum - secondNum
        return finalAns
    }
    func divideNum () -> Double {
        finalAns = firstNum / secondNum
        return finalAns
    }
    func multiplyNum () -> Double {
        finalAns = firstNum * secondNum
        return finalAns
    }
    func findPercentage () -> Double {
        finalAns = firstNum / 100
        return finalAns
    }
    func ifEquals() -> Double {
        finalAns = finalAns + firstNum
        return finalAns
    }
}
