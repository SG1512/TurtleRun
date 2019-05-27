//
//  soundeffect.swift
//  Test1
//
//  Created by Steven Gunawan on 27/05/19.
//  Copyright © 2019 Steven Gunawan. All rights reserved.
//

import Foundation
import AVFoundation

class MusicPlayer {
    static let shared = MusicPlayer()
    var audioPlayer: AVAudioPlayer?
    
    func playSoundEffect(soundEffect: String) {
        if let bundle = Bundle.main.path(forResource: "countdown1", ofType: "mp3") {
            let soundEffectUrl = NSURL(fileURLWithPath: bundle)
            do {
                audioPlayer = try AVAudioPlayer(contentsOf:soundEffectUrl as URL)
                guard let audioPlayer = audioPlayer else { return }
                audioPlayer.play()
            } catch {
                print(error)
            }
        }
    }
}
