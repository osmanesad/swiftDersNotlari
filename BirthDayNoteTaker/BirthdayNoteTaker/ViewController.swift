//
//  ViewController.swift
//  BirthdayNoteTaker
//
//  Created by Osman Esad on 4.01.2020.
//  Copyright © 2020 pixeldigitalart. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
       @IBOutlet weak var nameTextField: UITextField!
       @IBOutlet weak var birthdayTextField: UITextField!
       @IBOutlet weak var nameLabel: UILabel!
       @IBOutlet weak var birthdayLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedBirthday = UserDefaults.standard.object(forKey: "birthday")
        
        // Casting - as? yada as! > Yapabilrsen yada Kesin böyle olacak
        
        if let myName = storedName as? String { // Eğer yapabilirsen çok makbule geçer
            
            nameLabel.text = "Name: \(myName)"
        }
        
        if let myBirthday = storedBirthday as? String {
            
            birthdayLabel.text = "Birthday: \(myBirthday)"
        }
        
    }
    
    
    @IBAction func saveButton(_ sender: Any) {
        
        UserDefaults.standard.set(nameTextField.text!, forKey: "name")
        UserDefaults.standard.set(birthdayTextField.text!, forKey: "birthday")
        //UserDefaults.standard.synchronize() -> Yazılması zorunlu değil.
        
        
        nameLabel.text = "Name: \(nameTextField.text!)"
        birthdayLabel.text = "Birthday: \(birthdayTextField.text!)"
    }
    
    
    @IBAction func deleteButtom(_ sender: Any) {
        
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedBirthday = UserDefaults.standard.object(forKey: "birthday")
        
        
        
        // Şimdi şu şekilde yazarsam if let myName = storedName gibi devam edersem
        // Bana diyecek ki yav sen bunu yani myName'i kullanmıyorsun ki neden kelime israfı ediyorsun
        // Onun yerine if (storedName as?) !=nil şeklinde devam etsene
        // if (storedName as? String) != nil -> Eğer boş değilse
        
        
        
        // Eski Kod:
        
        //if let myName = storedName as? String {
            
            //UserDefaults.standard.removeObject(forKey: "name")
            
            //nameLabel.text = "Name: "
        //}
        
       //if let myBirthday = storedBirthday as? String {
            
            //UserDefaults.standard.removeObject(forKey: "birthday")
            
            //birthdayLabel.text = "Birthday: "
        //}
        
        // Yeni Kod:
        
        if (storedName as? String) != nil {
            
            UserDefaults.standard.removeObject(forKey: "name")
            
            nameLabel.text = "Name: "
        }
        
        if (storedBirthday as? String) != nil {
            
            UserDefaults.standard.removeObject(forKey: "birthday")
            
            birthdayLabel.text = "Birthday: "
        }
        
        
        
        
        
    }
    
}

