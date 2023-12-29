//
//  ViewController.swift
//  NursToDoList
//
//  Created by Нурсат Шохатбек on 25.12.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func addContacts(_ sender: Any) {
        let defaults = UserDefaults.standard
        
        let contactName = textField.text!
        
        var newContact = Contacts()
        
        newContact.name = contactName
        
        
        do {
            if let data = defaults.data(forKey: "contactItemArray"){
                var array = try JSONDecoder().decode([Contacts].self, from: data)
                
                array.append(newContact)
                
                let encodedata = try JSONEncoder().encode(array)
                
                defaults.set(encodedata, forKey: "contactItemArray")
            } else {
                
                let encodedata = try JSONEncoder().encode([newContact])
                
                defaults.set(encodedata, forKey: "contactItemArray")
            }
            
            
        } catch {
            print("unable to encode \(error)")
        }
//        if let array = defaults.array(forKey: "contactItemArray"){
//            contactarray = array as! [Contacts]
//
//            contactarray.append(newContact)
//
//            defaults.set(contactarray, forKey: "")
//        } else {
//            let array = [newContact]
//
//            defaults.set(contactarray, forKey: "contactItemArray")
//        }
//
        
        //        if let array = defaults.array(forKey: "contactArray"){
        //            contactarray = array as! [String]
        //
        //            contactarray.append(contactName)
        //
        //            defaults.set(contactarray, forKey: "contactArray")
        //        }else {
        //            let array = [contactName]
        //
        //            defaults.set(array, forKey: "contactArray")
        //        }
        textField.text = ""
    }
        
    
    }
    

