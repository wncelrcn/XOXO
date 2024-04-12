//
//  ContentView.swift
//  XOXO
//
//  Created by Wince Larcen on 4/10/24.
//

import SwiftUI

struct ContentView: View {
    
    //initialize player names and the gameState class
    @StateObject var gameState = GameState()
    @State private var player1Name = "Player 1"
    @State private var player2Name = "Player 2"
    
    // size of the cells
    let cellSize: CGFloat = 100
    
    var body: some View {
        VStack {
            // game title properties
            Text("XOXO: Tic-Tac-Toe")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
                .foregroundColor(.black)
                .frame(maxWidth: .infinity, alignment: .leading)
            // text showing current turn
            Text(gameState.turnText())
                .font(.title)
                .bold()
                .padding()
            // input player names
            HStack {
                TextField("Player 1 Name", text: $gameState.player1Name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                TextField("Player 2 Name", text: $gameState.player2Name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
            }
            // tictactoe board properties
            VStack(spacing: 0) {
                ForEach(0..<3) { row in
                    HStack(spacing: 0) {
                        ForEach(0..<3) { column in
                            CellView(cell: gameState.board[row][column])
                                .frame(width: cellSize, height: cellSize)
                                .background(Color.white)
                                .border(Color.black, width: 1)
                                .onTapGesture {
                                    gameState.placeTile(row, column)
                                }
                        }
                    }
                }
            }
            .background(Color.black)
            
            // display player 1 score
            Text(String(format: "%@: %d", gameState.player1Name, gameState.player1Score))
                .font(.title)
                .bold()
                .padding()
            // display player 2 score
            Text(String(format: "%@: %d", gameState.player2Name, gameState.player2Score))
                .font(.title)
                .bold()
                .padding()
            
            Spacer()
        }
        .padding()
        
        // alert when there is someone who won or if draw
        .alert(isPresented: $gameState.showAlert) {
            Alert(
                title: Text(gameState.alertMsg),
                dismissButton: .default(Text("Okay")) {
                    gameState.resetBoard()
                }
            )
        }
    }
}

// struct for the tile cells
struct CellView: View {
    let cell: Cell
    
    var body: some View {
        Text(cell.displayTile())
            .font(.system(size: 60))
            .foregroundColor(cell.tileColor())
            .bold()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .aspectRatio(1, contentMode: .fit)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
