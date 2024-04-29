//
//  AudioManager.swift
//  Color-Hunt
//
//  Created by Christopher Nathanael Tessy on 29/04/24.
//

import Foundation
import AVFoundation


class AudioManager: ObservableObject {
    var audioPlayer: AVAudioPlayer!
    
    func playBgMusic() {
        let url = Bundle.main.url(forResource: "backgroundMusic", withExtension: "mp4")
        audioPlayer = try! AVAudioPlayer(contentsOf: url!)
        audioPlayer.numberOfLoops = -1
        audioPlayer.play()
    }
}
