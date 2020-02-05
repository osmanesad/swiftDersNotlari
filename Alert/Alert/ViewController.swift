//
//  ViewController.swift
//  Alert
//
//  Created by Osman Esad on 5.02.2020.
//  Copyright © 2020 pixeldigitalart. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var userNameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var passwordAgainTextField: UITextField!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func singUpBtn(_ sender: Any) {
        
        if userNameTextField.text!.isEmpty || passwordTextField.text!.isEmpty || passwordAgainTextField.text!.isEmpty
        
        {
        
            let alert = UIAlertController(title: "Hooop dur bakalım !", message: "Kardeş bişeyi atladın gibi ama bi bak istersen(*)", preferredStyle: UIAlertController.Style.alert)
            let okeyBtn = UIAlertAction(title: "Tamamdır", style: UIAlertAction.Style.default) { (UIAlertAction) in
                // Butona tıklayınca olacak olanlar
                print("Tamam Butonuna Basıldı") //Log - > Clicked OK button
                
            }
            alert.addAction(okeyBtn)
            self.present(alert, animated: true, completion: nil)
        
        } else if  passwordTextField.text != passwordAgainTextField.text {
            let alert = UIAlertController(title: "Haydaaa !", message: "Kardeş bu seferde Parolan aynı değil !", preferredStyle: UIAlertController.Style.alert)
                       let okeyBtn = UIAlertAction(title: "Bir daha bakalım", style: UIAlertAction.Style.default) { (UIAlertAction) in
                           // Butona tıklayınca olacak olanlar
                           print("Tamam Butonuna Basıldı") //Log - > Clicked OK button
                           
                       }
                       alert.addAction(okeyBtn)
                       self.present(alert, animated: true, completion: nil)
        } else {print("Başarılı")} //Log - > Mission Complate
    }
    


}

