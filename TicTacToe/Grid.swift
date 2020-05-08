//
//  Grid.swift
//  TicTacToe
//
//  Created by Alyaa AlOstad on 5/8/20.
//  Copyright © 2020 Alyaa. All rights reserved.
//

import SwiftUI

struct Grid: View {
    @Binding var fields: [[Field]]
    @Binding var counter : Int
    @Binding var currentPlayer : String
    @Binding var winner : String
    
    var body: some View {
        VStack(spacing: 15){
            ForEach(0..<3){
                r in
                HStack(spacing:15){
                    ForEach(0..<3){ c in
                        TicTacToeButton(fields: self.$fields, counter: self.$counter, currentPlayer: self.$currentPlayer, winner: self.$winner, r: r, c: c)
                    }
                    
                }
            }
            
        }
    }
    
}

