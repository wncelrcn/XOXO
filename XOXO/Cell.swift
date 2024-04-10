//
//  Cell.swift
//  XOXO
//
//  Created by Wince Larcen on 4/10/24.
//

import Foundation
import SwiftUI


struct Cell {
    var tile: Tile
    
    func displayTile() -> String {
        switch (tile){
        case Tile.Nought:
            return "0"
        case Tile.Cross:
            return "X"
        default:
            return ""
        }
    }
    
    func tileColor() -> Color {
        switch (tile){
        case Tile.Nought:
            return Color.blue
        case Tile.Cross:
            return Color.black
        default:
            return Color.black
        }
    }
}


enum Tile {
    case Nought
    case Cross
    case Empty
}
