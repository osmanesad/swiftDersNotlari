//
//  ViewController.swift
//  ParseWithFoursquareClone
//
//  Created by Osman Esad on 24.07.2020.
//  Copyright © 2020 pixeldigitalart. All rights reserved.
//

import UIKit
import Parse

class SingupVC: UIViewController {
    
// MARK: - Onjects
    
    
    @IBOutlet weak var usernameTextfield: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
        // Örnek veritabanı kayıt işlemei Parse için.
        let parseObject = PFObject(className: "Words")
        parseObject["names"] = "Banana"
        parseObject["color"] = "Yellow"
        parseObject.saveInBackground { (success, error) in
            if error != nil {
                print(error?.localizedDescription as Any)
                
            } else {
                print("Added")
            }
        }
        */
        
        /*
        // Örnek veri çekme
        let query = PFQuery(className: "Words")
        query.whereKey("names", equalTo: "Car")
        query.findObjectsInBackground { (objects, error) in
        
    
            if error != nil {
                print(error?.localizedDescription as Any)
            } else {
                print(objects)
            }
        }
        */
        
        
      
        
    }
    
    
    
// MARK: - Sing In Button
    
    
    @IBAction func singinButton(_ sender: Any) {
        
        if usernameTextfield.text != "" && passwordTextField.text != "" {
            
            PFUser.logInWithUsername(inBackground: usernameTextfield.text!, password: passwordTextField.text!) { (user, error) in
                if error != nil {
                    self.makeAlert(titleInput: "Error", messageInput: error?.localizedDescription ?? "Error")
                } else {
                   
                    self.performSegue(withIdentifier: "toPlacesVC", sender: nil)
                }
            }
            
            
        } else {
            
            makeAlert(titleInput: "Error", messageInput: "Please username and password !")
            
        }
        
    }
    
// MARK: - Sing Up Button
    
    @IBAction func singupButton(_ sender: Any) {
        
        if usernameTextfield.text != "" && passwordTextField.text != "" {
            
            let user = PFUser()
            user.username = usernameTextfield.text!
            user.password = passwordTextField.text!
            user.signUpInBackground { (success, error) in
                if error != nil {
                    self.makeAlert(titleInput: "Error", messageInput: error?.localizedDescription ?? "Error")
                } else {
                    // Eğer kullanıcı kayıt yapabilirse istenilen ekrana yönlendir.
                    print("Kayıt Başarılı")
                }
            }
            
            
        } else {
            
            makeAlert(titleInput: "Error", messageInput: "Please username and password !")
            
        }
        
    }
    
    
    
// MARK: - Alert Message
    
    func makeAlert(titleInput:String, messageInput:String) {
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okBtn = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okBtn)
        self.present(alert, animated: true, completion: nil)
    }
    

}

