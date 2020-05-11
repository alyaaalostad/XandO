//
//  ContentView.swift
//  TicTacToe
//
//  Created by Alyaa AlOstad on 5/8/20.
//  Copyright © 2020 Alyaa. All rights reserved.
//

import SwiftUI




struct ContentView: View {
    @EnvironmentObject var env: Env
    var body: some View {
        ZStack{
   
            
            Image("dark")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .opacity(0.9)
            HStack{
                Button(action: {
                SoundEffect(sound: "Star Wars", type: "mp3")


                }) {
                    Image("music")
                        .foregroundColor(.white)


                    }
                .offset(x: 100, y:-340)
                .font(.system(size:50))

                Button(action: {
                    audioPlayer?.stop()

                }) {
                    Image("soundoff")
                        .foregroundColor(.white)


                    }
                .offset(x: 110, y:-340)
                .font(.system(size:50))

            }
            
    
                      
            VStack(spacing: 35){
                
                
                
                Text(env.winner)
                    .font(.system(size: 50, design: .rounded))
                    .bold()
                    .foregroundColor(.red)
                
                Text("\(env.currentPlayer.text())'s Trun")
                    .font(.system(size: 45, design: .rounded))
                    .foregroundColor(.white)
                    .bold()
                
                
                Text("\(env.counter)")
                    .font(.system(size: 45, design: .rounded))
                    .foregroundColor(.gray)
                    .bold()
                
                
                
                Grid()
                
                if env.winner != ""{
                    Button(action: {
                        self.env.restartGame()
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
    
    

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(Env())
    }
}
