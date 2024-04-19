//
//  SoundsBootcamp.swift
//  SwiftfulThinkingIntermediate-Level
//
//  Created by Alysson Menezes on 19/04/24.
//

import SwiftUI
import AVKit //audio e video kit da apple, componentes para reproduzir audio e video

// criar singletion para usar em qualquer parte do projeto
class SoundManager { // gerenciador de audio para usar em qualquer lugar 

    static let instance = SoundManager() // Singleton
    var player: AVAudioPlayer?
    
    enum SoundOption: String {
        case tada = "tada"
        case badum = "badum"
    }

    func playSound(sound: SoundOption) {
        
        guard let url = Bundle.main.url(forResource: sound.rawValue, withExtension: ".mp3") else { return }
          
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch {
            print("Error playing sound. \(error.localizedDescription)")
        }
    }
}

struct SoundsBootcamp: View {
     var soundManager = SoundManager()
    
    var body: some View {
        VStack (spacing: 40){
            Button("Play Button 1") {
                SoundManager.instance.playSound(sound: .tada)
            }
            
            Button("Play Button 2") {
                SoundManager.instance.playSound(sound: .badum)
            }
        }
    }
}

#Preview {
    SoundsBootcamp()
}
