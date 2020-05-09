//
//  SoundEffect.swift
//  TicTacToe
//
//  Created by Alyaa AlOstad on 5/9/20.
//  Copyright © 2020 Alyaa. All rights reserved.
//

import AVFoundation

var audioPlayer : AVAudioPlayer?

func SoundEffect(sound: String, type: String){
    if let path = Bundle.main.path(forResource: sound, ofType: type){
        
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        }catch{
            
     print("ERROR: couldn't play the sound")
        }
    }
    
}
