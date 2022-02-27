//
//  Audioplayer.swift
//  Alias
//
//  Created by Ivan Muzalevski on 27.02.22.
//

import Foundation
import AVFoundation

class Audioplayer {
    var player: AVAudioPlayer!
    
    func playSound(resource: String) {
        if resource == "ПРОПУСТИТЬ" {
        let url = Bundle.main.url(forResource: "skip", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
        }else if resource == "ПРАВИЛЬНО" {
            let url = Bundle.main.url(forResource: "right", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
        }else {
            let url = Bundle.main.url(forResource: "exit", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
        }
        
    }
    
}
