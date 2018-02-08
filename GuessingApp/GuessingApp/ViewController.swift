//
//  ViewController.swift
//  GuessingApp
//
//  Created by Gary Hicks on 2018-02-02.
//  Copyright © 2018 Gary Hicks. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBAction func Guess(_ sender: Any) {
        if let guess = textField.text{
            if let guessNum = Int(guess){
                let answer = arc4random_uniform(6)
                if answer == guessNum{
                    label.text = "Correct!"
                }
                else{
                    label.text="Incorrect."
                }
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

