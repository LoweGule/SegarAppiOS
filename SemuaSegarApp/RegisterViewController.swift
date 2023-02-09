//
//  RegisterViewController.swift
//  FinProLabMMS
//
//  Created by prk on 10/01/23.
//

import UIKit
import CoreData

class RegisterViewController: UIViewController, UITextFieldDelegate {
    
    var context: NSManagedObjectContext!
    

    @IBOutlet weak var Namatxt: UITextField!
    @IBOutlet weak var Usrnametxt: UITextField!
    @IBOutlet weak var Passwordtxt: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        context = appDelegate.persistentContainer.viewContext
    }
    
    @IBAction func RegisterButton(_ sender: UIButton) {
        if Namatxt.text == "" || Usrnametxt.text == "" || Passwordtxt.text == ""
            {
                let alert = UIAlertController(title: "Information", message: "Its Must to enter all the fields", preferredStyle: .alert)

                let ok = UIAlertAction(title: "Ok", style: .default, handler: nil)
                let cancel = UIAlertAction(title: "Cancel", style: .default, handler: nil)

                alert.addAction(ok)
                alert.addAction(cancel)

                self.present(alert, animated: true, completion: nil)

            }

            else
            {
                let nama = Namatxt.text!
                let userName = Usrnametxt.text!
                let passWord = Passwordtxt.text!
                let entity = NSEntityDescription.entity(forEntityName: "User", in:context)
                let newContacts = NSManagedObject(entity: entity!, insertInto: context)
                newContacts.setValue(nama, forKey: "nama")
                newContacts.setValue(userName, forKey: "username")
                newContacts.setValue(passWord, forKey: "password")
                

                do
                {
                    try context.save()
                    print("Registered  Sucessfully")
                }
                catch
                {
                    let Fetcherror = error as NSError
                    print("error", Fetcherror.localizedDescription)
                }
            }

            self.navigationController?.popViewController(animated: true)
    }
    
}
