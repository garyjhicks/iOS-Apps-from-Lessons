//
//  ViewController.swift
//  LogIn
//
//  Created by Gary Hicks on 2018-02-08.
//  Copyright © 2018 Gary Hicks. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    @IBOutlet weak var logoutButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var label: UILabel!
    
    @IBAction func logout(_ sender: Any) {
        
        let appDelegate  = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let request  = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        //request.returnsObjectsAsFaults = false - We don't need, deleting
        
        do {
            let results = try context.fetch(request)
            if results.count > 0 {
                for result in results as! [NSManagedObject]{
                    context.delete(result)
                    do {
                        try context.save()
                    }catch{
                        print("Individual delete failed")
                    }
                }
                label.alpha = 0
                logoutButton.alpha = 0
                textField.alpha = 1
                loginButton.setTitle("Login", for: [])
                isLoggedin = false
                
            }
            
        }catch{
            print("Delete Failed")
        }
    }
    
    var isLoggedin = false
    
    @IBAction func login(_ sender: Any) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        if isLoggedin == true {
            
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
            
            do{
                
                let results = try context.fetch(request)
                if results.count>0 {
                    for result in results as! [NSManagedObject] {
                        result.setValue(textField.text, forKey: "name")
                    }
                    do{
                        try context.save()
                    }catch{
                        print("Can't update username")
                    }
                    
                    label.text = "Hi \(textField.text!)!"
                    
                }
                
            }catch{
                print("Error updating username.")
            }
        }
        else{
    
            let newUser = NSEntityDescription.insertNewObject(forEntityName: "Users", into: context)
            
            newUser.setValue(textField.text, forKey: "name")
            
            do {
                
                try context.save()
                loginButton.setTitle("Update Username", for: [])
                label.alpha = 1
                label.text = "Hi \(textField.text!)!"
                isLoggedin = true
                logoutButton.alpha = 1
                
            } catch {
                print("There was an error when saving")
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let request  = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        request.returnsObjectsAsFaults = false
        
        do {
            
            let results = try context.fetch(request)
            
            for result in results as! [NSManagedObject] {
                
                if let username = result.value(forKey: "name") as? String {
                    textField.alpha = 1
                    loginButton.setTitle("Update Username", for: [])
                    logoutButton.alpha = 1
                    label.alpha = 1
                    label.text = "Hi \(username)!"
                    
                }
            }
            
        }catch{
            print("Couldn't fetch results")
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

