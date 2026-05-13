//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
        
    @IBAction func keyPressed(_ sender: UIButton) {
        let title = sender.currentTitle!
        playSound(title: title)
        Task {
            await flashButton(sender: sender)
        }
    }
    
    func flashButton(sender: UIButton) async {
        sender.alpha = 0.3
        try? await Task.sleep(for: .milliseconds(150))
        sender.alpha = 1
    }
    
    func playSound(title: String) {
        let url = Bundle.main.url(forResource: title, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
}
