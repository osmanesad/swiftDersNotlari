//
//  ViewController.swift
//  OdevHesapMakinasi
//
//  Created by Osman Esad on 28.12.2019.
//  Copyright © 2019 pixeldigitalart. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    var result = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBOutlet weak var textBox1: UITextField!
    @IBOutlet weak var textBox2: UITextField!
    @IBOutlet weak var sonuc: UILabel!
    
    
    
    @IBAction func topla(_ sender: Any) {
        
        if let firstNumber = Int(textBox1.text!){
            if let secondNumber = Int(textBox2.text!){
                result = firstNumber + secondNumber
                sonuc.text = String(result)
                 }
            
        }
        
        
     
    }
    @IBAction func cikar(_ sender: Any) {
        
        if let firstNumber = Int(textBox1.text!){
                   if let secondNumber = Int(textBox2.text!){
                       result = firstNumber - secondNumber
                       sonuc.text = String(result)
                        }
                   
               }
               
    }
    @IBAction func carpma(_ sender: Any) {
        
        if let firstNumber = Int(textBox1.text!){
                   if let secondNumber = Int(textBox2.text!){
                       result = firstNumber * secondNumber
                       sonuc.text = String(result)
                        }
                   
               }
               
    }
    @IBAction func bolme(_ sender: Any) {
        
        if let firstNumber = Int(textBox1.text!){
                   if let secondNumber = Int(textBox2.text!){
                       result = firstNumber / secondNumber
                       sonuc.text = String(result)
                        }
                   
               }
               
    }
    
}

