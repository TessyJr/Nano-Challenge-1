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
    
    func playTimerMusic() {
        let url = Bundle.main.url(forResource: "timerMusic", withExtension: "mp4")
        audioPlayer = try! AVAudioPlayer(contentsOf: url!)
//        audioPlayer.enableRate = true
//        audioPlayer.rate = 0.9
        audioPlayer.numberOfLoops = -1
        audioPlayer.play()
    }   
    
    func playVictoryMusic() {
        let url = Bundle.main.url(forResource: "victoryMusic", withExtension: "mp4")
        audioPlayer = try! AVAudioPlayer(contentsOf: url!)
        audioPlayer.play()
    }
    
    func pauseMusic() {
        if audioPlayer != nil && audioPlayer.isPlaying {
            audioPlayer.pause()            
        }
    }
}
