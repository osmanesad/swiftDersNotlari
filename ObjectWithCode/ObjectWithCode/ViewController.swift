//
//  ViewController.swift
//  ObjectWithCode
//
//  Created by Osman Esad on 3.01.2020.
//  Copyright © 2020 pixeldigitalart. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var myLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let width = view.frame.size.width // Ekranın değerlerini alıyoruz.
        let height = view.frame.size.height
        
        
        myLabel.text = "Kendi Label'ım"
        myLabel.textAlignment = .center
        myLabel.frame = CGRect(x: width * 0.5 - width * 0.8 / 2, y: height * 0.5, width: width * 0.8, height: 50)
        view.addSubview(myLabel)
        
        let mySecondLabel = UILabel()
        mySecondLabel.text = "İkinci Label'ım"
        mySecondLabel.textAlignment = .center
        mySecondLabel.frame = CGRect.init(x: 150, y: 150, width: 100, height: 50)
        view.addSubview(mySecondLabel)
        
        let myButton = UIButton()
        myButton.setTitle("İlk Butonum", for: UIControl.State.normal)
        myButton.setTitleColor(UIColor.blue, for: UIControl.State.normal)
        myButton.frame = CGRect.init(x: width * 0.5 - 50, y: height * 0.6, width: 100, height: 100)
        view.addSubview(myButton)
        
        myButton.addTarget(self, action: #selector(ViewController.myAction), for: UIControl.Event.touchUpInside) //Kullanıcı butona tıklayınca ne olacak?
        
        
        
    }
    
    @objc func myAction() {
        myLabel.text = "Bak değiştim" // Butona basıca ilk label'ım textini değiştiriyorum
        
        // Ama öncesinde myLabel'ımı en tepeye class içine tanımladım ki evrensel olsun. Ve burada çağırabileyim
    
    }


}

