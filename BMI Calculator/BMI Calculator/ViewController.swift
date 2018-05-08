//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Prasul Surendran on 26/04/18.
//  Copyright © 2018 Prasul Surendran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var weightInKg: UITextField!
    @IBOutlet weak var heightInCms: UITextField!
    @IBOutlet weak var bmiOutputField: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func calculateBMI(_ sender: Any) {
        bmiOutputField.text = calculateBMI()
    }
    
    func calculateBMI() -> String{
        let myWeight = Double(weightInKg.text!)
        var myHeight = Double(heightInCms.text!)
        myHeight = Double(myHeight!/100)
        let myBmi = Double(myWeight!/pow(myHeight!, 2))
        let shortBMI = String(format: "%.2f", myBmi)
        var bmiMessage = ""
        if myBmi > 25 {
            bmiMessage = "Your BMI score is \(shortBMI). You are Overweight, workout!!"
        }
        else if myBmi < 25 && myBmi > 19.5 {
            bmiMessage = "Your BMI score is \(shortBMI). Your are running Ideal weight!"
        }
        else {
            bmiMessage = "Your BMI score is \(shortBMI). You are underweight, start eating!"
        }
        
        return bmiMessage
    }
}

