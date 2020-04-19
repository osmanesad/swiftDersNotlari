//
//  ViewController.swift
//  BirimCevirici
//
//  Created by Osman Esad on 19.04.2020.
//  Copyright © 2020 pixeldigitalart. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var usdLabel: UILabel!
    @IBOutlet weak var eurLabel: UILabel!
    @IBOutlet weak var turLabel: UILabel!
    @IBOutlet weak var btcLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func vericekBtn(_ sender: Any) {
        
        // Visit: https://fixer.io/
        
        // Request & Session - Sorgu
        // 1.Step
        let url = URL(string: "http://data.fixer.io/api/latest?access_key=YOUR ACCESS KEY")
        let session = URLSession.shared
        
        // Closure
        
        let task = session.dataTask(with: url!) { (data, response, error) in
            if error != nil {
                let alert = UIAlertController(title: "Error - Hata !", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                let okButton = UIAlertAction(title: "Ok - Tamam", style: UIAlertAction.Style.default, handler: nil)
                alert.addAction(okButton)
                self.present(alert, animated: true, completion: nil)
            } else {
                
                // Response - Veriyi Al
                //2.Step
                if data != nil {
                    do{
                    let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary<String, Any>
                        
                        // async
                        
                        DispatchQueue.main.async {
                            // Örnek: print(jsonResponse["date"])
                            
                         
                            if let rates = jsonResponse["rates"] as? [String: Any] {
                                // Örnek: print(rates)
                                
                                if let usd = rates["USD"] as? Double {
                                    // print(usd)
                                    self.usdLabel.text = "USD: \(usd)"
                                }
                                
                                if let eur = rates["EUR"] as? Double {
                                    // print(usd)
                                    self.eurLabel.text = "EUR: \(eur)"
                                }
                                
                                if let tur = rates["TRY"] as? Double {
                                    // print(usd)
                                    self.turLabel.text = "TUR: \(tur)"
                                }
                                
                                if let btc = rates["BTC"] as? Double {
                                    // print(usd)
                                    self.btcLabel.text = "BTC: \(btc)"
                                }
                            }
                        }
                        
                    }catch {
                        print("Hata! Error")
                    }
                    
                }
            }
        }
        
        task.resume()
        
        
        
        
        // Parsing & JSON Serialization - Veriyi İşle
        
    }
    
}

