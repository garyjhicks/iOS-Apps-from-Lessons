//
//  ViewController.swift
//  MusicPlayer
//
//  Created by Gary Hicks on 2018-02-08.
//  Copyright © 2018 Gary Hicks. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player = AVAudioPlayer()
    var timer = Timer()
    let audioPath = Bundle.main.path(forResource: "Flower", ofType: "mp3")
    
    @objc func updateTime() {
        timeSlider.value = Float(player.currentTime)
    }

    @IBAction func play(_ sender: Any) {
        timer=Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.updateTime), userInfo: nil, repeats: true)
        player.play()
    }
    
    @IBAction func volumeChange(_ sender: Any) {
        player.volume = volumeSlider.value
    }
    
    @IBOutlet weak var volumeSlider: UISlider!
    
    @IBAction func timeChange(_ sender: Any) {
        player.currentTime = TimeInterval(timeSlider.value)
    }
    
    @IBOutlet weak var timeSlider: UISlider!
    
    @IBAction func pause(_ sender: Any) {
        player.pause()
        timer.invalidate()
    }
    @IBAction func restartButton(_ sender: Any) {
        print("Hi")
        timeSlider.value = 0
        timer.invalidate()
        player.pause()
        player.currentTime = 0
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        do{
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
            timeSlider.maximumValue = Float(player.duration)
        
        }catch{
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

