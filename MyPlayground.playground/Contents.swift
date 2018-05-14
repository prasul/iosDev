//: Playground - noun: a place where people can play

import UIKit
func fibanocciGenerator(rangeVal : Int){
    var fibSeries: [Int] = []
    var fibNumber : Int = 0
    var fibNumberPrev : Int = 1
    var fibNumberMain : Int = 0
    for _ in 0...rangeVal{
        fibNumberMain = fibNumber + fibNumberPrev
        fibNumberPrev = fibNumber
        fibNumber = fibNumberMain
        fibSeries.append(fibNumberMain)
        
    }
    print("The fibanocci series for the range of \(rangeVal) is \t \t = \(fibSeries)")
}

func multiplesOf(rangeVal : Int) {
    var sumOfMultiples: Int = 0
    for i in 1...(rangeVal-1){
        if i % 3 == 0 || i % 5 == 0 {
            sumOfMultiples += i
        }
    }
    print("Sum of All multiples Of 3 or 5 is \(sumOfMultiples) below ")
}

func evenFibanocci(limitVal : Int){
    var fib = 1
    var prevFib = 1
    var temp = 1
    var totalSum: Int = 0
    
    if (fib < limitVal) {
        if (fib % 2 == 0) {
            totalSum += fib
        }
        fib = prevFib + fib
        prevFib = temp
        temp = fib
    }
}

fibanocciGenerator(rangeVal : 30)
multiplesOf(rangeVal: 1000)


