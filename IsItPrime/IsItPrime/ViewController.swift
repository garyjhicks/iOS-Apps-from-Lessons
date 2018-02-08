//
//  ViewController.swift
//  IsItPrime
//
//  Created by Gary Hicks on 2018-02-02.
//  Copyright © 2018 Gary Hicks. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBAction func check(_ sender: Any) {
        if let input = textField.text{
            if let number = Int(input){
                var divider = number
                var counter = 0
                while divider>0{
                    if number==(number/divider)*divider{
                        counter+=1
                    }
                    divider=divider-1
                }
                if counter <= 2{
                    label.text = "It is prime!"
                }
                else{
                    label.text = "It is not prime."
                }
            }
            else{
                label.text="Enter a positive integer!"
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

