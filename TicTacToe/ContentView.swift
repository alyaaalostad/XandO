//
//  ContentView.swift
//  TicTacToe
//
//  Created by Alyaa AlOstad on 5/8/20.
//  Copyright © 2020 Alyaa. All rights reserved.
//

import SwiftUI

struct Field{
    var Text: String
    var enabled: Bool
}


struct ContentView: View {
    @State var fields: [[Field]] = .init(repeating: .init(repeating: Field(Text: "", enabled: true), count: 3), count: 3)
    
    @State var counter = 0
    @State var currentPlayer = "X"
    @State var winner = ""
    
    var body: some View {
        ZStack{
            
            Image("dark")
                .resizable()
                .edgesIgnoringSafeArea(.all)
//                .opacity(0.8)
            
            
            VStack(spacing: 35){
                
                Text(winner)
                    .font(.system(size: 50, design: .rounded))
                    .bold()
                    .foregroundColor(.red)
                
                Text("\(currentPlayer)'s Trun")
                    .font(.system(size: 45, design: .rounded))
                    .foregroundColor(.white)
                    .bold()
                
                
                Text("\(counter)")
                    .font(.system(size: 45, design: .rounded))
                    .foregroundColor(.gray)
                    .bold()
                
                
                
                Grid(fields: $fields, counter: $counter, currentPlayer : $currentPlayer, winner: $winner)
                
                if winner != ""{
                    Button(action: {
                        self.restartGame()
                    }) {
                        Text("Restart Game")
                            .font(.system(size: 45, design: .rounded))
                            .foregroundColor(Color.green)
                            .bold()
                    }
                }
                
            }
        }
    }
    
    
    func restartGame(){
        fields = .init(repeating: .init(repeating: Field(Text: "", enabled: true), count: 3), count: 3)
        winner = ""
        counter = 0
        currentPlayer = "X"
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
