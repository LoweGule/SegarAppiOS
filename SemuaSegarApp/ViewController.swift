//
//  ViewController.swift
//  SemuaSegarApp
//
//  Created by prk on 10/01/23.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITextFieldDelegate {
    
    var username = [String]()
    var userpass = [String]()
    @IBOutlet weak var UsrNmLogintxt: UITextField!
    @IBOutlet weak var PwLogintxt: UITextField!
    
   
    var result = [String]()
    var context: NSManagedObjectContext!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        context = appDelegate.persistentContainer.viewContext
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func Login(_ sender: UIButton) {
        let usernameInput = UsrNmLogintxt.text
        let passInput = PwLogintxt.text
        if usernameInput!.isEmpty || passInput!.isEmpty
        {
            let alert = UIAlertController(title: "Information", message: "Please enter all the fields", preferredStyle: .alert)
            
            let ok = UIAlertAction(title: "Ok", style: .default, handler: nil)
            let cancel = UIAlertAction(title: "Cancel", style: .default, handler: nil)
            
            alert.addAction(ok)
            alert.addAction(cancel)
            
            self.present(alert, animated: true, completion: nil)
        }
        else
        {
            let appdelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appdelegate.persistentContainer.viewContext
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
                 fetchRequest.returnsObjectsAsFaults = false
            do{
                let results = try context.fetch(fetchRequest)
                for result in results as! [NSManagedObject]{
                    if let username1 = result.value(forKey:"username") as? String{
                             self.username.append(username1)
                         }
                         if let password = result.value(forKey: "password") as? String{
                             self.userpass.append(password)
                         }
                                 
                     }
                 }catch{
                     print("error")
                 }
                 
                 if (username.contains(usernameInput!)){
                     let userIndex = username.firstIndex(where: {$0 == usernameInput})
                             
                     if userpass[userIndex!] == passInput{
                         performSegue(withIdentifier: "loginUser", sender: nil)
                     }
                 }else{
                     let alert = UIAlertController(title: "Warning", message: "Wrong username/password!", preferredStyle: .alert)
                     let okAction = UIAlertAction(title: "OK", style: .default)
                     
                     alert.addAction(okAction)
                     self.present(alert, animated: true, completion: nil)
                 }
             }
             }
        }
    
    
   

