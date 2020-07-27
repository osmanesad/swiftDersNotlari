//
//  ViewController.swift
//  yeniNotlar
//
//  Created by Osman Esad on 4.06.2020.
//  Copyright © 2020 pixeldigitalart. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
// MARK: - Nesneler
    @IBOutlet weak var notTableView: UITableView!
    
// MARK: - Değişkenler
    
    var notlarListe = [Notlar]()
    var ref:DatabaseReference!
    
    
// MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
        
        notTableView.delegate = self
        notTableView.dataSource = self
        
        ref = Database.database().reference()
        
    }
    
// MARK: - Detay Ekranına Geçiş
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("Not Detay Ekranına Geçti")
        
        if segue.identifier == "toNotDetay" {
            let indeks = sender as? Int
            let gidilecekVC = segue.destination as! NotDetayViewController
            
            gidilecekVC.not = notlarListe[indeks!]
        }
    }
    
    
// MARK: - Arayüz Güncelleme
    override func viewWillAppear(_ animated: Bool) {
        tumNotlariAl()
        
    }
    
// MARK: - Tum Notlar Fonksiyonu
    
    func tumNotlariAl(){
        ref.child("notlar").observe(.value , with: {snapshot in
            if let gelenVeriButunu = snapshot.value as? [String:AnyObject]{
                self.notlarListe.removeAll()
                
                for gelenSatirVerisi in gelenVeriButunu {
                    
                    
                    if let sozluk = gelenSatirVerisi.value as? NSDictionary{
                        let key = gelenSatirVerisi.key
                        
                        let adres = sozluk["adres"] as? String ?? ""
                        let not = sozluk["not"] as? String ?? ""
                        let tarih = sozluk["tarih"] as? Double
                        //let date = document.get("date") as? Timestamp
                        
                        let gelennot = Notlar(not_id: key, tarih: tarih!, adres: adres, not: not)
                        
                        self.notlarListe.append(gelennot)
                    }
                }
                
            } else {
                self.notlarListe = [Notlar]()
                
            }
            
            DispatchQueue.main.async {
                if self.notlarListe.count != 0 {
                    self.navigationItem.prompt = "Toplam Not Sayisi: \(self.notlarListe.count)"
                } else {
                    
                    self.navigationItem.prompt = "Okunacak Not Yok"
                    
                }
            self.notTableView.reloadData()
                
            }
            
        })
    }
    

    
    
    
    

}

extension ViewController:UITableViewDataSource, UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notlarListe.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let not = notlarListe[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "notHucre", for: indexPath) as! NotHucreTableViewCell
        
        
       
        
        
        let t = not.tarih
        let zaman = NSDate(timeIntervalSince1970: t/1000)
        
       
        
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = NSTimeZone.local
        dateFormatter.dateFormat = "hh:mm a"
        let time = dateFormatter.string(from: zaman as Date)
        
       
        
        print(NSDate(timeIntervalSince1970: t/1000))
        cell.kalanZamanLabel.text = time
        cell.adresLabel.text = not.adres
        cell.yorumLabel.text = not.not
        
        return cell
    }
    
    
    
    
    
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "toNotDetay", sender: indexPath.row)
    }
    
    
    
    
    
    
// MARK: - Alert Message
    @objc func makeAlert(titleInput: String, messageInput: String){
           let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
           let okBtn = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
           alert.addAction(okBtn)
           self.present(alert, animated: true, completion: nil)
           }
    
    
    
}
