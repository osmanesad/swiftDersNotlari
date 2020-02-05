//
//  ViewController2.swift
//  SegueApp
//
//  Created by Osman Esad on 5.01.2020.
//  Copyright © 2020 pixeldigitalart. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {

    @IBOutlet weak var myLabel2: UILabel!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    
    var myName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = myName
    }
    

    

}
