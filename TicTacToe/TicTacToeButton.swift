//
//  TicTacToeButton.swift
//  TicTacToe
//
//  Created by Alyaa AlOstad on 5/8/20.
//  Copyright © 2020 Alyaa. All rights reserved.
//

import SwiftUI

struct TicTacToeButton: View {
    @Binding var fields: [[Field]]
    @Binding var counter : Int
    @Binding var currentPlayer : String
    @Binding var winner : String
    var r : Int
    var c : Int
    
    var body: some View {
        Button(action: {
            if self.fields[self.r][self.c].enabled{
                self.fields[self.r][self.c].Text = self.currentPlayer
                self.currentPlayer = self.currentPlayer == "X" ? "O" : "X"
                self.fields[self.r][self.c].enabled = false
                self.counter += 1
                self.checkWinner()
                
            }
        }) {
            
            Text(self.fields[self.r][self.c].Text)
                .foregroundColor(.black)
            .bold()
                .frame(width: 110, height: 110, alignment: .center)
                .background(Color.white)
                .font(.system(size: 45, design: .rounded))
                .opacity(0.5)
        }
    }
    
    func checkWinner(){
        
        func winners(player: String){
            
            let r1 = fields[0][0].Text == player && fields[0][1].Text == player && fields[0][2].Text == player
            let r2 = fields[1][0].Text == player && fields[1][1].Text == player && fields[1][2].Text == player
            let r3 = fields[2][0].Text == player && fields[2][1].Text == player && fields[2][2].Text == player
            let c1 = fields[0][0].Text == player && fields[1][0].Text == player && fields[2][0].Text == player
            let c2 = fields[0][1].Text == player && fields[1][1].Text == player && fields[2][1].Text == player
            let c3 = fields[0][2].Text == player && fields[1][2].Text == player && fields[2][2].Text == player
            let d1 = fields[0][0].Text == player && fields[1][1].Text == player && fields[2][2].Text == player
            let d2 = fields[0][2].Text == player && fields[1][1].Text == player && fields[2][0].Text == player
            
            if r1 || r2 || r3 || c1 || c2 || c3 || d1 || d2
            {
                winner = "\(player) Won!!!"
                SoundEffect(sound: "game", type: "mp3")
            }
            else if counter == 9{
                winner = "It's a Tie"
            }
        }
        winners(player: "X")
        winners(player: "O")
        
    }
}

