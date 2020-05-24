//
//  HumanClass.swift
//  Struct
//
//  Created by Osman Esad on 24.05.2020.
//  Copyright © 2020 pixeldigitalart. All rights reserved.
//

import Foundation

class HumanClass {
    
    var name: String
    var age: Int
    var skill: String
    
    init(nameInput: String, ageInput: Int, skillInput: String) {
        self.name = nameInput
        self.age = ageInput
        self.skill = skillInput
    }
    
    func zamanMakinesi () {
        self.age += 1 // Bunu Class içinde self ile yapabiliriz.
    }
    
}
