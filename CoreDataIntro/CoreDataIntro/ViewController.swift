//
//  ViewController.swift
//  CoreDataIntro
//
//  Created by Gary Hicks on 2018-02-08.
//  Copyright © 2018 Gary Hicks. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext
        
        /*
        let newUser = NSEntityDescription.insertNewObject(forEntityName: "Users", into: context)
        
        newUser.setValue("Gary", forKey: "username")
        newUser.setValue("mypass", forKey: "password")
        newUser.setValue(2, forKey: "age")
 
        
        do {
            
            try context.save()
            print("Saved")
            
        } catch {
            print("There was an error")
        }t
        */
        
        let request  = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        //request.predicate = NSPredicate(format: "username = %@", "Ralphie")
        request.returnsObjectsAsFaults = false
        
        do {
            
            let results = try context.fetch(request)
            if results.count>0 {
                for result in results as! [NSManagedObject] {
                    
                    if let username = result.value(forKey: "username") as? String {
                        /*
                        context.delete(result)
                        
                        //result.setValue("Dooley", forKey: "username")
                        
                        do {
                            
                            try context.save()
                            print("Saved")
                            
                        } catch {
                            print("There was an error renaming")
                        }*/
                        print(username)
                    }
                }
            }
            else {
                print("No results")
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

