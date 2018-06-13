//
//  ViewController.swift
//  CalculatorTry
//
//  Created by Prasul Surendran on 17/05/18.
//  Copyright © 2018 Prasul Surendran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var outputLabel: UILabel!
    @IBOutlet weak var historyLabel: UILabel!
    var tempVal : String?
    var historyTag : String = ""
    var calcStart = CalcModel()
    var cacheNum : Double = 0
    
    var firstRun : Bool = true
    var isDecimal : Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        tempVal = ""
        calcStart.operatorVal = ""
        calcStart.secondNum = 0
        outputLabel.text = String(format: "%.0f", "\(calcStart.firstNum )")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        let mathArray = ["+", "-", "x", "÷", "="]
        print(sender.currentTitle ?? "")
        if mathArray.contains(sender.currentTitle!){
            if calcStart.firstNum == 0 {
                calcStart.firstNum = Double(tempVal!)!
                historyTag = "\(historyTag) \(calcStart.firstNum )\(sender.currentTitle ?? "") "
            }else if calcStart.secondNum == 0 {
                if let _ :Double = calcStart.secondNum {
                calcStart.secondNum = Double(tempVal ?? "")!
                historyTag = historyTag + String(format:"%.0f", calcStart.secondNum )
                }}
            print("going to perform Math with \(historyTag)")
            //            outputLabel.text = sender.currentTitle
            tempVal = ""
            historyLabel.text = historyTag
        }else {
            tempVal = "\(tempVal!)"+"\(sender.currentTitle!)"
            outputLabel.text = tempVal
        }
    }
    // End of Button actions
    
    //negate Number
    func negateNum(sampleNum : Double){
        if sampleNum > 0{
            outputLabel.text = "- \(sampleNum)"
        }else if sampleNum < 0{
            outputLabel.text = "\(abs(sampleNum))"
        }else if sampleNum == 0 {
            outputLabel.text = "\(sampleNum)"
        }
    }
    //calculate percentage
    func calcPercentage(percentageNum : Double){
        let percValue = percentageNum / 100
        outputLabel.text = "\(percValue)"
    }
    // update history Label
    func updateHistoryLabel(historyVal : String ){
        if isDecimal == false {
            historyTag = historyTag + String(format: "%.0f", historyVal)
        }else if isDecimal == true{
            historyTag = historyTag + historyVal
        }
        historyLabel.text = historyTag
    }
    
}

