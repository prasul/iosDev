//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 27/01/2016.
//  Copyright © 2016 London App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController{
    var player: AVAudioPlayer?
    var keyPressed : String = ""
    //creating a array of all notes
    var notesToPlay = ["note1", "note2", "note3", "note4", "note5", "note6", "note7"]

    override func viewDidLoad() {
        super.viewDidLoad()
    }



    @IBAction func notePressed(_ sender: UIButton) {
        
        //finding which Key was pressed based on the tag id.
        keyPressed = notesToPlay[sender.tag-1]
        let url = Bundle.main.url(forResource: keyPressed, withExtension: "wav")
        
        do {
            player =  try AVAudioPlayer(contentsOf: url!)
            guard let player = player else {return}
            
            // From Documentation: Negative integer value to loop the sound indefinitely until you call the stop method.
            player.prepareToPlay()
            player.play()
        } catch let error as Error {
            print(Error.self)
        }
    }
    
  

}

