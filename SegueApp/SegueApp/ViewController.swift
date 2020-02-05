//
//  ViewController.swift
//  SegueApp
//
//  Created by Osman Esad on 5.01.2020.
//  Copyright © 2020 pixeldigitalart. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var userName =  ""

    @IBOutlet weak var myLabel: UILabel!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Kullanıcı daha görmeden yüklenen bileşenler
        
        
    }
    
   
    
    override func viewWillAppear(_ animated: Bool) {
        print("viewWillAppear")
        
        // viewDidLoad'dan sonra gelen kullanıcı artık görecek
        
    
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("viewWillDisappear")
        
        //Kullanıcı artık gördü aşaması
    }
    
    override func viewDidDisappear(_ animated: Bool) {
           print("viewDidDisappear")
        // View controler her an gidebilir
           
       }
    
    override func viewDidAppear(_ animated: Bool) {
        print("viewDidAppear")
        
        // Artık yok
        
    }
    
    

    @IBAction func nextButton(_ sender: Any) {
        userName = nameTextField.text!
        performSegue(withIdentifier: "toSecondVC", sender: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSecondVC" {
           let destinationVC = segue.destination as! ViewController2
            destinationVC.myName = userName
        }
    }
}

