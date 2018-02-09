//
//  ViewController.swift
//  RandomSound
//
//  Created by Gary Hicks on 2018-02-08.
//  Copyright © 2018 Gary Hicks. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player = AVAudioPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if event?.subtype == UIEventSubtype.motionShake {
            
            let sounds = ["boing", "explosion", "hit", "knife", "shoot", "swish", "wah", "warble"]
            
            let random = Int(arc4random_uniform(UInt32(sounds.count)))
            
            let audioPath = Bundle.main.path(forResource: sounds[random], ofType: "mp3")
            
            do{
                try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
                player.play()
            }catch{
            }
        }
    }

}

