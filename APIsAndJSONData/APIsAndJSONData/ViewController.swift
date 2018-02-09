//
//  ViewController.swift
//  APIsAndJSONData
//
//  Created by Gary Hicks on 2018-02-08.
//  Copyright © 2018 Gary Hicks. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func find(_ sender: Any) {
        
        if let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=\(textField.text!.replacingOccurrences(of: " ", with: "%20"))&appid=43c8ecf26a892ddff74b5ef8a34716cf") {
            
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                
                if error != nil {
                    print(error as Any)
                }
                else{
                    if let urlContent = data {
                        
                        do{
                            let jsonResult = try JSONSerialization.jsonObject(with: urlContent, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                            print(jsonResult)
                            
                            print(jsonResult["name"])
                            
                            if let description = ((jsonResult["weather"] as? NSArray)?[0] as? NSDictionary)?["description"] as? String {
                                DispatchQueue.main.sync(execute: {
                                    self.label.text = description
                                    self.textField.text = ""
                                })
                            }
                            
                        }catch{
                            print("JSON Process Error")
                        }
                        
                    }
                }
                
            }
            task.resume()
        }
        else{
            self.label.text = "Oops! We can't seem to find the weather there :("
            self.textField.text = ""
        }
    }
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

