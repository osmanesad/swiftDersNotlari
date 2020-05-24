//
//  HumanStruct.swift
//  Struct
//
//  Created by Osman Esad on 24.05.2020.
//  Copyright © 2020 pixeldigitalart. All rights reserved.
//

import Foundation

struct HumanStruct {
    var name: String
    var age : Int
    var skill : String
    
    
    // init tanımlamamıza gerek kalmıyor.
    
    
   mutating func zamanMakinesi() { // Direkt func değilde "mutating" eklersek değişime izin var
       // self.age += 1  -> Bu şekilde izin yok - Eğer func sadece kullanılırsa
    self.age += 1 // Eğer mutating kullanırsak izin var.
        
    }
}
