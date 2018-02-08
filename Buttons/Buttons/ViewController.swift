//
//  ViewController.swift
//  Buttons
//
//  Created by Gary Hicks on 2018-02-01.
//  Copyright © 2018 Gary Hicks. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var label: UILabel!
    
    @IBAction func Go(_ sender: Any) {
        if let age = textField.text{
            if let ageNumber = Int(age){
                let newAge = String(ageNumber*7)
                label.text = "Your red panda is " + newAge + " in panda years"
            }
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

