//
//  main.swift
//  RunNine
//
//  Created by Rhonda Oglesby on 12/31/18.
//  Copyright © 2018 RO. All rights reserved.
//
//  Gameboard UI
//  ---------------------------
//  Locked cell = *g1
//  Empty cell  =  x
//  Tile 9 of yellow set = y9
//  Tile 5 of blue set   = b5
//  Tile 3 of green set  = g3

import Foundation

var fromRC : String
var toRC   : String
let rows = 4                //  number of sets plus 1 blank set
let cols = 9
let rowRange = 1...rows
let colRange = 1...cols
let set  = 100
var gameBoard = [Int]()     //  num cells = rows * cols
var gameTiles = [Int]()     //  Tiles numbered 1-(col) repeated (rows) times
var tempTiles = [String]()  //  b1, b2,...b9, y1, y2,...y9, g1, g2,...g9

class Tile {
    var tval : Int
    var tcolor : Int
    var trow : Int
    var tcol : Int
    var tface: String
    var lock : Bool
    
    init(tval:Int = 0, tcolor:Int = 0, trow:Int = 0, tcol:Int = 0, tface:String = "", lock:Bool = false) {
        self.tval   = tval
        self.tcolor = tcolor
        self.trow  = trow
        self.tcol  = tcol
        self.tface = tface
        self.lock  = lock
    }
}   //  class Tile

//  SETUP ===========================================
//
//  - Build tile codes.
//    if (code == 107) then
//       set  = 1 = code / 100
//       tile = 7 = code - (set * 100)
//
var allTiles = [Tile]()

for x in 1...rows {
    for y in 1...cols {
        gameTiles.append(y + (x * set))
    }
}

let setColor = ["", "b", "y", "g", "--"]  //  Set 0 = not used, 1 = blue, 2 = yellow, 3 = green, 4 = empty

//  Translate tile codes for display.
//  if (code == 304)
//      translated = g4
func TranslateTileCode(_ v:Int) -> String {
    let s = v / set
    let val = v % set
    if (s == rows) {
        return(setColor[s])
    }
    else {
        return(setColor[s] + String(val))
    }
                
}

func ValidCellEntry(row r:String, col c:String) -> Bool {
    if (rowRange.contains( Int(r)! ) && colRange.contains( Int(c)! ) ) {
        return true
    }
    else { return false }
}

//  - Shuffle tiles
//
gameBoard = gameTiles.shuffled()

for z in stride(from: 0, to:gameTiles.count, by:1) {
    print("Z = ", z, ", Value = ", gameBoard[z])
}

//  - Calculate # of tiles locked = put in an evaluate CLASS
//  - Calculate # of tiles left to sequence - put in an evaluate CLASS

//  UI  ===========================================
//  Display tiles

//  - Print Column headers
print("    ", terminator:"")
for i in 1...cols {
    print("| ", i, "", terminator: "")
}
print("|")
for _ in 1...cols {
    print("-----", terminator: "")
}
print("-----")

//  - Print each row of tiles
//

for j in 0..<rows {
    print("|", j, "|", terminator: "")
    for k in 0..<cols {
        print("", TranslateTileCode(gameBoard[k+(j*cols)]), "|", terminator: "")
    }
    print("")
}

//  Prompt for from-R/C
print("Enter the FROM RC -> ")
var validInput = true

//  - validate
while (validInput) {

    fromRC = readLine()!
    let fr : Character = fromRC.removeFirst()
    let fc = fromRC
    
    if (ValidCellEntry(row:String(fr), col:fc)) {
    print("Invalid entry.")
    print("Enter the Row value and Column value for the tile you want to move.")
    print("Ex. 12 = Row 1, Column 2 contains tile ", "xx", terminator:".")
    fromRC = readLine()!
    }
}
CFConvertDoubleHostToSwapped(<#T##arg: Double##Double#>)
//  Prompt for to-R/C

print("Enter the TO RC -> ")
toRC = readLine()!

//  - validate
var tr : Character = toRC.removeFirst()
var tc = toRC

//  Validate tile move
//  - valid R/C entry?
//  - Is there a tile at the from-R/C?
//  - Is there an empty cell at the to-R/C
//  - Is it a valid move?
//  if !VALID (
//              print msg
//              prompt for new value )
//  else (move tile)

//  Move the tile
//  - how many moves are left?
//  - If WIN (exit)
//  - else (display new board)

//  Display board
