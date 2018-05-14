//: Playground - noun: a place where people can play

import UIKit
//defining the external parameter countOfBeers and internal parameter countingDown for better code readability. can use _ for the function and this will remove the need to get external parameter and the function can be called as beerFunc(9) instead.
func beerFunc(countOfBeers countingDown: Int) -> String {
        var lyrics: String = ""
        var lyricsN : String = ""
        //reversing the count
        for i in (1...countingDown).reversed(){
            if (i == 1) {
                lyricsN = "1 bottle of beer on the wall, 1 bottle of beer.\nTake one down and pass it around, no more bottles of beer on the wall.\n\n"
                lyrics += lyricsN
            }
            else {
                lyricsN = "\(i) bottles of beer on the wall, \(i) bottles of beer.\nTake one down and pass it around, \(i-1) bottles of beer on the wall.\n\n"
                lyrics += lyricsN
            }
    }
    lyrics += "No more bottles of beer on the wall, no more bottles of beer. \nGo to the store and buy some more, \(countingDown) bottles of beer on the wall.\n\n"
    return lyrics
}
//calling the function and execution
print(beerFunc(countOfBeers: 8))


