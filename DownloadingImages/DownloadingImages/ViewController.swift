//
//  ViewController.swift
//  DownloadingImages
//
//  Created by Gary Hicks on 2018-02-08.
//  Copyright © 2018 Gary Hicks. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var newImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        
        if documentsPath.count > 0 { // make sure we have at least one
            let documentsDirectory = documentsPath[0]
            let restorePath = documentsDirectory + "/newImage.jpg"
            
            
            newImageView.image = UIImage(contentsOfFile: restorePath)
            
        }
        
        //New section
        
        /*
        let url = URL(string: "https://upload.wikimedia.org/wikipedia/en/b/b2/Mashimaro_-_01.png")!
        
        let request = NSMutableURLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request as URLRequest){
            data, response, error in
            
            if error != nil {
                print(error)
            }
            else{
                if let data = data { //read up on guard statements
                    
                    DispatchQueue.main.sync {
                        if let newImage = UIImage(data: data) {
                            
                            self.newImageView.image = newImage
                            
                            let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
                            
                            if documentsPath.count > 0 { // make sure we have at least one
                                let documentsDirectory = documentsPath[0]
                                let savePath = documentsDirectory + "/newImage.jpg"
                                
                                do{
                                    try UIImageJPEGRepresentation(newImage, 1)?.write(to: URL(fileURLWithPath: savePath))
                                }catch{
                                    print("Error! Oops!")
                                }
                                
                                
                            }
                        }
                    }
                }
            }
            
        }
        task.resume()
        */
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

