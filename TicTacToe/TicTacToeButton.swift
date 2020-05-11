//
//  TicTacToeButton.swift
//  TicTacToe
//
//  Created by Alyaa AlOstad on 5/8/20.
//  Copyright © 2020 Alyaa. All rights reserved.
//

import SwiftUI

struct TicTacToeButton: View {
    @EnvironmentObject var env: Env
    var r : Int
    var c : Int
    
    var body: some View {
        Button(action: {
     
            self.env.tapButton(r: self.r, c: self.c)
        
        }) {
            
            Text(self.env.fields[r][c].player.text())
                .foregroundColor(.black)
            .bold()
                .frame(width: 110, height: 110, alignment: .center)
                .background(Color.white)
                .font(.system(size: 45, design: .rounded))
                .opacity(0.5)
        }
    }

}

