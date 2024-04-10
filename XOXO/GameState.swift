//
//  GameState.swift
//  XOXO
//
//  Created by Wince Larcen on 4/10/24.
//

import Foundation


class GameState: ObservableObject{
    
    // initialize variables for the board, turn, scores, and alert
    @Published var board = [[Cell]]()
    @Published var turn = Tile.Nought
    @Published var player1Score = 0
    @Published var player2Score = 0
    @Published var showAlert = false
    @Published var alertMsg = "Draw"
    
    // initialize
    init() {
        resetBoard()
    }
    
    // function for placing the "X" and "O" in the board
    func placeTile (_ row: Int, _ column: Int){
        
        // check if the spot in the board is already occupied
        if(board[row][column].tile != Tile.Empty){
            return
        }
        
        // first turn is always "O"
        board[row][column].tile = turn == Tile.Nought ? Tile.Nought : Tile.Cross
        
        // conditional to check if somebody won
        if (isWin()) {
            
            // if its "O"'s turn, add score to player1
            if (turn == Tile.Nought){
                player1Score += 1
            }
            else {
                // if its "X"'s turn, add score to player2
                player2Score += 1
            }
            
            let winner = turn == Tile.Nought ? "Player 1" : "Player 2"
            
            alertMsg = "\(winner) Wins!"
            
            showAlert = true
        }
        
        else {
            // next turn
            turn = turn == Tile.Nought ? Tile.Cross : Tile.Nought
        }
        
        // conditional to check if its a draw
        if (isDraw()) {
            alertMsg = "Its a Draw!"
            showAlert = true
        }
    
    }
    
    // function to check who won the game
    func isWin() -> Bool {
        
        // winning combinations (vertical)
        if isTurnTile(0, 0) && isTurnTile(1, 0) && isTurnTile(2, 0){
            return true
        }
        else if isTurnTile(0, 1) && isTurnTile(1, 1) && isTurnTile(2, 1){
            return true
        }
        else if isTurnTile(0, 2) && isTurnTile(1, 2) && isTurnTile(2, 2){
            return true
        }
        
        // winning combinations (horizontal)
        else if isTurnTile(0, 0) && isTurnTile(0, 1) && isTurnTile(0, 2){
            return true
        }
        else if isTurnTile(1, 0) && isTurnTile(1, 1) && isTurnTile(1, 2){
            return true
        }
        else if isTurnTile(2, 0) && isTurnTile(2, 1) && isTurnTile(2, 2){
            return true
        }
        
        // winning combinations (diagonal)
        else if isTurnTile(0, 0) && isTurnTile(1, 1) && isTurnTile(2, 2){
            return true
        }
        else if isTurnTile(0, 2) && isTurnTile(1, 1) && isTurnTile(2, 0){
            return true
        }
        
        // if no one won (draw)
        else {
            return false
        }
        
    }
    
    // function to get the position of the tiles
    func isTurnTile(_ row: Int, _ column: Int) -> Bool {
        
        return board[row][column].tile == turn
    }
    
    // function to see if the game ends in a draw
    func isDraw() -> Bool {
        
        // Check for a draw condition first
        
        var isBoardFull = true
        for row in board {
            for cell in row {
                if cell.tile == Tile.Empty {
                    
                    // If any cell is empty, the game is not a draw
                    isBoardFull = false
                    break
                    
                }
            }
        }
        
        if isBoardFull {
            // If the board is full, and there's no winner, it's a draw
            return !isWin()
        }
        
        return false
    }

    
    // function for resetting the board
    func resetBoard() {
        
        var newBoard = [[Cell]]()
        
        for _ in (0...2) {
            
            var row = [Cell]()
            
            for _ in (0...2) {
                
                row.append(Cell(tile: Tile.Empty))
                
            }
            newBoard.append(row)
        }
        board = newBoard
    }
}
