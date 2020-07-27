//
//  NotDetayViewController.swift
//  yeniNotlar
//
//  Created by Osman Esad on 4.06.2020.
//  Copyright © 2020 pixeldigitalart. All rights reserved.
//

import UIKit
import Firebase

class NotDetayViewController: UIViewController {
// MARK: - Nesneler
    @IBOutlet weak var adresTextField: UITextField!
    @IBOutlet weak var notTextField: UITextField!
    
// MARK: - Referanslar
    
    var not:Notlar?
    var ref:DatabaseReference!
    
// MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()
        
        if let n = not {
            adresTextField.text = n.adres
            notTextField.text = n.not
        }

    }
    
// MARK: - Güncelle Butonu
    @IBAction func guncelleBtn(_ sender: Any) {
        
        if let n = not, let adres = adresTextField.text, let not = notTextField.text {
                   
            notGuncelle(not_id:n.not_id, adres:adres, not:not)
               }
        
        
    }
    
// MARK: - Sil Butonu
    @IBAction func silBtn(_ sender: Any) {
       
        makeAlert(titleInput: "Dikkat!", messageInput: "Notunuzu Silmek Üzeresiniz.")
        if let n = not {
                   notSilme(not_id: n.not_id)
               }
        
       
    }
    
// MARK: - Not Silme Fonksiyonu
    func notSilme(not_id: String){
        
        ref.child("notlar").child(not_id).removeValue()
        
    }
    
// MARK: - Not Güncelleme Fonksiyonu
    func notGuncelle(not_id:String, adres:String, not:String) {
        ref.child("notlar").child(not_id).updateChildValues(["adres":adres,"not":not])
        
    }
    
    
    // MARK: - Alert Message
    @objc func makeAlert(titleInput: String, messageInput: String){
           let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okBtn = UIAlertAction(title: "Onayla", style: UIAlertAction.Style.default, handler: nil)
        let cancelBtn = UIAlertAction(title: "İptal", style: UIAlertAction.Style.cancel, handler: nil)
           alert.addAction(okBtn)
        alert.addAction(cancelBtn)
           self.present(alert, animated: true, completion: nil)
           }
    

}
