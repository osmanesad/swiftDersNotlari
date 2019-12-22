//
//  ViewController.swift
//  MyFirstApp
//
//  Created by Osman Esad on 22.12.2019.
//  Copyright © 2019 pixeldigitalart. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Kullanıcı ekranını ilk açtığında birşeyler olsun istersek.
    }
    
    
    
    
    
    @IBAction func buttonClicked(_ sender: Any) {
        
        imageView.image=UIImage(named: "manzara2")
    }
    

}

