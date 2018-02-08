//
//  ViewController.swift
//  WeatherApp
//
//  Created by Gary Hicks on 2018-02-05.
//  Copyright © 2018 Gary Hicks. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var label: UILabel!
    @IBAction func find(_ sender: Any) {
        
        if let myUrl = URL(string: "https://www.weather-forecast.com/locations/\(textField.text!.replacingOccurrences(of: " ", with: "-"))/forecasts/latest"){
            let myRequest = NSMutableURLRequest(url:myUrl)
            
            let task = URLSession.shared.dataTask(with: myRequest as URLRequest){
                data, response, error in
                
                var message = ""
                
                if let error = error {
                    print(error)
                }
                else{
                    if let unwrappingData = data {
                        let dataString = NSString(data: unwrappingData, encoding: String.Encoding.utf8.rawValue)
                        //print(dataString)
                        
                        var stringSeperator = "Weather Today </h2>(1&ndash;3 days)</span><p class=\"b-forecast__table-description-content\"><span class=\"phrase\">"
                        if let contentArray = dataString?.components(separatedBy: stringSeperator){
                            if contentArray.count>1{
                                stringSeperator = "</span>"
                                let newContentArray = contentArray[1].components(separatedBy: stringSeperator)
                                if newContentArray.count>1{
                                    message = newContentArray[0].replacingOccurrences(of: "&deg;", with: "°")
                                    //print(message)
                                }
                                
                            }
                        }
                    }
                }
                if message == "" {
                    message = "Oops! We couldn't find the weather :("
                }
                DispatchQueue.main.sync(execute: {
                    self.label.text=message
                })
            }
            task.resume()
        }
        else{
            label.text = "Oops! We couldn't find the weather :("
        }
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

