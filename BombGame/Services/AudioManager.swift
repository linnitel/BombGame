//
//  AudioManager.swift
//  BombGame
//
//  Created by Андрей Завадский on 14.02.2025.
//

import AVFoundation

class AudioManager {
    static let shared = AudioManager()

    private var audioPlayers: [String: AVAudioPlayer] = [:]

    private init() {}

    func playSound(named fileName: String, fileExtension: String = "mp3", volume: Float = 0.5, loops: Int = -1) {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: fileExtension) else {
            print("Файл \(fileName).\(fileExtension) не найден")
            return
        }

        DispatchQueue.global(qos: .background).async { [self] in
            do {
                let player = try AVAudioPlayer(contentsOf: url)
                player.numberOfLoops = loops
                player.volume = volume
                player.prepareToPlay()
                player.play()

                DispatchQueue.main.async { [self] in
                    audioPlayers[fileName] = player //сохраняем плеер, чтобы не удалялся из памяти
                }
            } catch {
                print("Ошибка воспроизведения \(fileName): \(error.localizedDescription)")
            }
        }
    }

    func stopSound(named fileName: String) {
        audioPlayers[fileName]?.stop()
        audioPlayers.removeValue(forKey: fileName)
    }

    func stopAllSounds() {
        for (_, player) in audioPlayers {
            player.stop()
        }
        audioPlayers.removeAll()
    }
}
