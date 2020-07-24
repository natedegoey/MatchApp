//
//  SoundManager.swift
//  MatchApp
//
//  Created by Nathan DeGoey on 2020-06-22.
//  Copyright © 2020 Nathan DeGoey. All rights reserved.
//

import Foundation
import AVFoundation

class SoundManager {
    
    var audioPlayer:AVAudioPlayer?
    
    // create an enum data type that can be one of four values
    enum SoundEffect {
        case flip
        case match
        case nomatch
        case shuffle
    }
    
    func playSound(effect:SoundEffect) {
        
        
        var soundFileName = ""
        
        switch effect {
            
            case .flip:
                soundFileName = "cardflip"
                
            case .match:
                soundFileName = "dingcorrect"
            
            case .nomatch:
                soundFileName = "dingwrong"
            
            case .shuffle:
                soundFileName = "shuffle"

            
        }
        
        // Get the path to the resource
        let bundlePath = Bundle.main.path(forResource: soundFileName, ofType: ".wav")
        
        // Check that it is not nil. Make sure that bundlePath does not equal nil, otherwise, return. Guard cheks to make sure everything is okay before proceeding
        guard bundlePath != nil else {
            // Couldn't find the resource, exit
            return
        }
        
        let url = URL(fileURLWithPath: bundlePath!)
        
        
        // Error handling
        do {
            
            // try to do this, which may throw an error
            //Create the audio file
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            
            //play the sound effect
            audioPlayer?.play()
            
        }
        catch {
            print("Couldn't create an audio player")
            return
        }
        
        
    }
    
}
