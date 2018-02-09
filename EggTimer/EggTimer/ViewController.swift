//
//  ViewController.swift
//  EggTimer
//
//  Created by Gary Hicks on 2018-02-03.
//  Copyright © 2018 Gary Hicks. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    var timer = Timer()
    var time = 210
    
    @IBAction func remove(_ sender: Any) {
        if time>10 {
           time=time-10
            label.text = String(time)
        }
        else{
            time=0
            label.text = String(time)
        }
    }
    
    @IBAction func add(_ sender: Any) {
        time=time+10
        label.text = String(time)
    }
    
    @IBAction func reset(_ sender: Any) {
        time=210
        label.text = String(time)
    }
    
    @IBAction func play(_ sender: Any) {
        timer=Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.processTimer), userInfo: nil, repeats: true)
    }
    
    @IBAction func pause(_ sender: Any) {
        timer.invalidate()
    }
    
    @objc func processTimer() {
        if time>0 {
            label.text = String(time)
            time=time-1
        }
        else{
            timer.invalidate()
            time=0
            label.text = String(time)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        label.text="210"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }


}

