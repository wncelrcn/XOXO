//
//  ContentView.swift
//  XOXO
//
//  Created by Wince Larcen on 4/10/24.
//

import SwiftUI

struct ContentView: View {
    // initialize the gamestate
    @StateObject var gameState = GameState()
    
    
    var body: some View {
        //set borderSize
        let borderSize = CGFloat(5)
        
        // create a vertical stack
        VStack(spacing: borderSize){
            
            // for each loop for each button create a hstack
            ForEach(0...2, id: \.self){
                row in
                HStack(spacing: borderSize){
                    
                    // for each loop for the "X" and "O" inside
                    ForEach(0...2, id: \.self){
                        
                        column in
                        
                        let cell = gameState.board[row][column]
                        
                        Text(cell.displayTile())
                        // board properties
                            .font(.system(size: 60))
                            .foregroundColor(cell.tileColor())
                            .bold()
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .aspectRatio(1, contentMode: .fit)
                            .background(Color.white)
                            .onTapGesture {
                                gameState.placeTile(row, column)
                            }
                        
                    }
                }
            }
        }
        
        .background(Color.black)
        .padding()
        
        // alert message if player 1 or 2 wins, and if game is draw
        .alert(isPresented: $gameState.showAlert)
        {
            Alert(
                title: Text(gameState.alertMsg),
                dismissButton: .default(Text("Okay"))
                {
                    gameState.resetBoard()
                }
            )
        }
    }
}

#Preview {
    ContentView()
}
