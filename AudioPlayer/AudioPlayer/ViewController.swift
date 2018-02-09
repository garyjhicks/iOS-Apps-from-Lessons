//
//  ViewController.swift
//  AudioPlayer
//
//  Created by Gary Hicks on 2018-02-07.
//  Copyright © 2018 Gary Hicks. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player = AVAudioPlayer()
    
    @IBOutlet weak var slider: UISlider!
    
    @IBAction func play(_ sender: Any) {
        player.play()
    }

    @IBAction func pause(_ sender: Any) {
        player.pause()
    }
    
    @IBAction func sliderMoved(_ sender: Any) {
        player.volume = slider.value
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        let audioPath = Bundle.main.path(forResource: "Flower", ofType: "mp3")
        do {

            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
        
        }catch{
        //To catch errors
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

