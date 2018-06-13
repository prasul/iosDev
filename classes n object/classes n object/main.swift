//
//  main.swift
//  classes n object
//
//  Created by Prasul Surendran on 24/05/18.
//  Copyright © 2018 Prasul Surendran. All rights reserved.
//

import Foundation

print("Hello, World!")
let myDefaultCar = Car()
let myCar  = Car(customCarColour: "red")
print(" I drive my \(myCar.colour) car, a \(myCar.modelOfCar) and it is running with \(myCar.numberOfSeats) people on board! Although my usual car is \(myDefaultCar.colour)")
let mySelfDrivingCar = SelfDrivingCar()
mySelfDrivingCar.drive()
print(mySelfDrivingCar.colour)

