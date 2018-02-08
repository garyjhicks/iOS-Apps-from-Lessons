//
//  ViewController.swift
//  WebContent
//
//  Created by Gary Hicks on 2018-02-04.
//  Copyright © 2018 Gary Hicks. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let myUrl = URL(string: "https://www.stackoverflow.com"){
            let myRequest = URLRequest(url: myUrl)
            webView.load(myRequest)
            let task = URLSession.shared.dataTask(with: myRequest as URLRequest){
                data, response, error in
                
                if let error = error{
                    print(error)
                }
                else{
                    if let unwrappedData = data {
                        let dataString = NSString(data: unwrappedData, encoding: String.Encoding.utf8.rawValue)
                        print(dataString)
                        
                        DispatchQueue.main.sync(execute: {
                        
                        })
                    }
                }
                
            }
            task.resume()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

