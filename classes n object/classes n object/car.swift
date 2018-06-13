//
//  car.swift
//  classes n object
//
//  Created by Prasul Surendran on 24/05/18.
//  Copyright © 2018 Prasul Surendran. All rights reserved.
//

import Foundation
//general convention to create all enum types at top
enum CarType{
    case Coupe
    case Sedan
    case Hatchback
}
class Car {
    var colour = "Black"
    var numberOfSeats : Int = 5
    var modelOfCar : CarType = .Coupe
    init(){
    }
    convenience init(customCarColour : String){
        self.init()
        colour = customCarColour
    }
    
    func drive(){
        print("Starting... Vroom!")
    }
}
