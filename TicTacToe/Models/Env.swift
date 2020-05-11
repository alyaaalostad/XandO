//
//  Env.swift
//  TicTacToe
//
//  Created by Alyaa AlOstad on 5/11/20.
//  Copyright © 2020 Alyaa. All rights reserved.
//

import Foundation

class Env : ObservableObject{
    @Published var fields: [[Field]] = .init(repeating: .init(repeating: Field(player: .none, enabled: true), count: 3), count: 3)
     
    @Published var counter: Int = 0
    @Published var currentPlayer: Player = .x
    @Published var winner: String = ""
    
    func restartGame(){
        fields = .init(repeating: .init(repeating: Field(player: .none, enabled: true), count: 3), count: 3)
        winner = ""
        counter = 0
        currentPlayer = .x
    }
    
    func tapButton(r: Int, c: Int){
        if fields[r][c].enabled{
                 fields[r][c].player = currentPlayer
                 currentPlayer.toggle()
                 fields[r][c].enabled = false
                 counter += 1
                 checkWinner()
}
    }
    
    
    func checkWinner(){
        
        func winners(player: Player){
            
            let c = (player, player, player)
            let r1 = (fields[0][0].player, fields[0][1].player, fields[0][2].player) == c
            let r2 = (fields[1][0].player, fields[1][1].player, fields[1][2].player) == c
            let r3 = (fields[2][0].player, fields[2][1].player, fields[2][2].player) == c
            let c1 = (fields[0][0].player, fields[1][0].player, fields[2][0].player) == c
            let c2 = (fields[0][1].player, fields[1][1].player, fields[2][1].player) == c
            let c3 = (fields[0][2].player, fields[1][2].player, fields[2][2].player) == c
            let d1 = (fields[0][0].player, fields[1][1].player, fields[2][2].player) == c
            let d2 = (fields[0][2].player, fields[1][1].player, fields[2][0].player) == c
            
            if r1 || r2 || r3 || c1 || c2 || c3 || d1 || d2
            {
                winner = "\(player.text()) Won!!!"
                SoundEffect(sound: "game", type: "mp3")
            }
            else if counter == 9{
                winner = "It's a Tie"
            }
        }
        winners(player: .x)
        winners(player: .o)
        
    }
}
