//
//  ContentView.swift
//  XOXO
//
//  Created by Wince Larcen on 4/10/24.
//

import SwiftUI

struct ContentView: View {
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
                        Text("X")
                        
                        // board properties
                            .font(.system(size: 60))
                            .bold()
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .aspectRatio(1, contentMode: .fit)
                            .background(Color.white)
                        
                    }
                }
            }
        }
        
        .background(Color.black)
        .padding()
    }
}

#Preview {
    ContentView()
}
