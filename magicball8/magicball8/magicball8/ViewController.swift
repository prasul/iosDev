//
//  ViewController.swift
//  magicball8
//
//  Created by Prasul Surendran on 20/04/18.
//  Copyright © 2018 Prasul Surendran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let ballArray = ["ball1", "ball2", "ball3", "ball4", "ball5"]
    var randomBallNumber : Int = 0
    
    @IBOutlet weak var imageView1: UIImageView!
    
    @IBOutlet weak var mainLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        updateBallImages()
            }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func askButtonPressed(_ sender: Any) {
        updateBallImages()
        
    }
    func updateBallImages(){
        randomBallNumber = Int(arc4random_uniform(5))
        imageView1.image = UIImage (named: ballArray[randomBallNumber])
        
    }
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        updateBallImages()
    }
    
}

