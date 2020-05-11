//
//  Grid.swift
//  TicTacToe
//
//  Created by Alyaa AlOstad on 5/8/20.
//  Copyright © 2020 Alyaa. All rights reserved.
//

import SwiftUI

struct Grid: View {
    @EnvironmentObject var env: Env
    
    var body: some View {
        VStack(spacing: 15){
            ForEach(0..<3){
                r in
                HStack(spacing:15){
                    ForEach(0..<3){ c in
                        TicTacToeButton(r: r, c: c)
                    }
                    
                }
            }
            
        }
    }
    
}

