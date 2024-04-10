//
//  Cell.swift
//  XOXO
//
//  Created by Wince Larcen on 4/10/24.
//

import Foundation
import SwiftUI

// initialize struct for the "X" and "O"
struct Cell {
    var tile: Tile
    
    // function for display of "X" and "O" in the Tic-Tac-Toe Board
    func displayTile() -> String {
        
        // switch cases for the diff cases ?!
        switch (tile){
        case Tile.Nought:
            return "0"
        case Tile.Cross:
            return "X"
        default:
            return ""
        }
    }
    
    // function for the tile color
    func tileColor() -> Color {
        switch (tile){
        case Tile.Nought:
            return Color.blue
        case Tile.Cross:
            return Color.red
        default:
            return Color.black
        }
    }
}

// enum for the different cases of the tile (could be X, O, or Empty)
enum Tile {
    case Nought
    case Cross
    case Empty
}
