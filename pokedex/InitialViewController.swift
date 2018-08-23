//
//  InitialViewController.swift
//  pokedex
//
//  Created by Milos Jakovljeivc on 3/16/17.
//  Copyright © 2017 Milos Jakovljeivc. All rights reserved.
//

import UIKit
import AVFoundation

class InitialViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        playBackgroundMusic(filename: "03 Title Screen.mp3")
    }
    var backgroundMusicPlayer = AVAudioPlayer()
    func playBackgroundMusic(filename: String) {
        let url = Bundle.main.url(forResource: filename, withExtension: nil)
        guard let newURL = url else {
            print("Could not find file: \(filename)")
            return
        }
        do {
            backgroundMusicPlayer = try AVAudioPlayer(contentsOf: newURL)
            backgroundMusicPlayer.numberOfLoops = -1
            backgroundMusicPlayer.prepareToPlay()
            backgroundMusicPlayer.play()
        } catch let error as NSError {
            print(error.description)
        }
    }

    @IBAction func button(_ sender: Any) {
        
        backgroundMusicPlayer.stop()
        
  }
}
