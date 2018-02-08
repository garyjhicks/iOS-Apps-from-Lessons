//
//  SecondViewController.swift
//  ToDo
//
//  Created by Gary Hicks on 2018-02-04.
//  Copyright © 2018 Gary Hicks. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textField: UITextField!

    @IBAction func add(_ sender: Any) {
        
        let taskObject = UserDefaults.standard.object(forKey: "task")
        var task : [String]
        
        if let tempTask = taskObject as? [String]{
            task=tempTask
            task.append(textField.text!)
            print(task)
        }
        else{
            
            task = [textField.text!]
        }
        
        UserDefaults.standard.set(task, forKey: "task")
        
        textField.text = ""
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        return true
        
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

