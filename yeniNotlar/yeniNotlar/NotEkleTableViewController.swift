//
//  NotEkleTableViewController.swift
//  yeniNotlar
//
//  Created by Osman Esad on 4.07.2020.
//  Copyright © 2020 pixeldigitalart. All rights reserved.
//

import UIKit
import Firebase

class NotEkleTableViewController: UITableViewController {

    @IBOutlet weak var adresTextField: UITextField!
    
    @IBOutlet weak var notTextField: UITextField!
    
    @IBOutlet weak var bildirimAc: UISwitch!
    
    @IBOutlet weak var bildirimTarihiLabel: UILabel!
    
    @IBOutlet weak var tarihPicker: UIDatePicker!
    
    
    var ref:DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()

       
    }


    @IBAction func ekleBtn(_ sender: Any) {
        
        
               if let adres = adresTextField.text, let not = notTextField.text {
                   
                   notEkle(adres: adres, not: not, tarih: Double())
               }
               
               makeAlert(titleInput: "Notunuz eklendi.", messageInput: "Yeni not ekleyebilirsiniz.")
               
               adresTextField.text = ""
               notTextField.text = ""
              // tarihTextField.text = ""
    }
    
    @IBAction func datePickerDurum(_ sender: UIDatePicker) {
        
        
    }
    
    @IBAction func AksiyonBtn(_ sender: UISwitch) {
    }
    
    
    func notEkle(adres:String, not:String, tarih: Double){
           let dict = ["adres":adres, "not":not, "tarih": ServerValue.timestamp()] as [String : Any]
          let newRef = ref.child("notlar").childByAutoId()
          newRef.setValue(dict)
           
           
           
          
           
       }
    
    
    @objc func makeAlert(titleInput: String, messageInput: String){
    let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
    let okBtn = UIAlertAction(title: "Tamam", style: UIAlertAction.Style.default, handler: nil)
    alert.addAction(okBtn)
    self.present(alert, animated: true, completion: nil)
    }
    
    
    
}
