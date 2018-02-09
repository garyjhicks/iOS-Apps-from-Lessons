//
//  ViewController.swift
//  Animations
//
//  Created by Gary Hicks on 2018-02-05.
//  Copyright © 2018 Gary Hicks. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func fadeIn(_ sender: Any) {
        image.alpha = 0
        UIView.animate(withDuration: 1, animations: {
            self.image.alpha = 1
            })
    }
    
    @IBAction func slideIn(_ sender: Any) {
        image.center = CGPoint(x: image.center.x - 500, y: image.center.y)
        UIView.animate(withDuration: 1, animations: {
            self.image.center = CGPoint(x: self.image.center.x+500, y: self.image.center.y)
            })
    }
    
    @IBAction func grow(_ sender: Any) {
        image.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        UIView.animate(withDuration: 1) {
            self.image.frame = CGRect(x:20, y:230, width: 374, height: 277)
        }
    }
    
    @IBOutlet weak var button: UIButton!
    
    var i = 1
    var isAnimating = true
    var timer = Timer()
    
    @objc func animate() {
        
        image.image = UIImage(named: "frame_\(i)_delay-0.1s.gif")
        if i == 8 {
            i=0
        }
        else{
            i+=1
        }
    }
    
    @IBOutlet weak var image: UIImageView!
    
    @IBAction func next(_ sender: Any) {
        
        if isAnimating == false {
            timer.invalidate()
            isAnimating = true
            button.setTitle("Start Gif", for: [])
            
        }
        else{
            timer=Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.animate), userInfo: nil, repeats: true)
            isAnimating = false
            button.setTitle("Stop Gif", for: [])
            
        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

