//
//  ViewController.swift
//  StoringPhoneNumber
//
//  Created by Gary Hicks on 2018-02-03.
//  Copyright © 2018 Gary Hicks. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textFile: UITextField!
    
    @IBAction func save(_ sender: Any) {
        
        UserDefaults.standard.set(textFile.text, forKey: "number")

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let numberObject = UserDefaults.standard.object(forKey: "number")
        if let number = numberObject as? String{
            textFile.text = number
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

