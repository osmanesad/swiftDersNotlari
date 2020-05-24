//
//  main.swift
//  Struct
//
//  Created by Osman Esad on 24.05.2020.
//  Copyright © 2020 pixeldigitalart. All rights reserved.
//

import Foundation

print("Selam selam")

// Değişebilir
let classBilge = HumanClass(nameInput: "Bilge", ageInput: 140, skillInput: "Shaman")

print(classBilge.name)



// Değişmez - Sonradan var yaparsak değişebilir.
var structKayra = HumanStruct(name: "Kayra", age: 150, skill: "Kam")

print(structKayra.name)


classBilge.age = 141 // let ile tanımlamamıza rağmen değişme izin veriyor.

print(classBilge.age)

// structKayra.age = 141 - > Struct buna izin vermez!!! Eğer yukarıda var yapardak izin verir.

structKayra.age = 151

print(structKayra.age)

// Gelelim dalavereli kısma

let ghostClassBilge = classBilge
var ghostStructKayra = structKayra

print(ghostClassBilge.age)
print(ghostStructKayra.age)

ghostClassBilge.age = 142

ghostStructKayra.age = 152

print(ghostClassBilge.age)
print(ghostStructKayra.age)


// Gereçk kişilerimizi çağıralım

print(classBilge.age) // Ama Bilge hayaletinden etkilendi!
print(structKayra.age) // Kayra mantıken ghostKayraya benzemez!


// MARK: - Dersin Notu


// Reference Types - > Class
// Copy -> Samae object new reference -> 1 object + 2 reference


// Value Types - Strcut
// Copy -> new object -> 2 objects


// MARK: - Func Kullanalım - Mutating

// Son yaşlarımız Bilge =  142, Kayra = 151

print(classBilge.age)
classBilge.zamanMakinesi()
print(classBilge.age)

print(structKayra.age)
structKayra.zamanMakinesi()
print(structKayra.age)


// MARK: - Tuple

print("|||| Tuple ||||")

let firstTuple = (3,4)

print(firstTuple.0)

var secondTuple = (6,8,9)
secondTuple.1 = 11

print(secondTuple.1)

let thirtTuple = ("Bilge", 140)

let fourthTuple = (1,[2,3,4])

print(fourthTuple.1[0])


let predefinedTuple: (String, String)

predefinedTuple.0 = "Bilge"
predefinedTuple.1 = "Kayra"

print(predefinedTuple.0)

let Bilge = (age: 140, shaman: true)
print(Bilge.age, Bilge.shaman)


// MARK: - Guard Lef & If Let

print("|||| Guard & If ||||")

// Guard - > Negative && Confident
// If - > Positive

let number = "6" // or let number = "Papaya"

func convertToIntegerGuard (stringInput: String) -> Int {
    guard let myInteger = Int(stringInput) else {
        return 0
    }
    return myInteger
}

func convertToIntegerIf (stringInput: String) -> Int {
    if let myInteger = Int(stringInput) {
        return myInteger
    } else {
        
        return 0
    }
    
}


print(convertToIntegerGuard(stringInput: number))
print(convertToIntegerIf(stringInput: number))


// MARK: - Switch

print("|||| Switch ||||")

let newNumber = 11

// Reminder

let myRemainder = newNumber % 4

print(myRemainder)

if myRemainder == 1 {
    print("it's 1")
} else if  myRemainder == 2 {
    print("it's 2")
} else if myRemainder == 3 {
    print("it's 3")
}
    

switch myRemainder {
case 1: // Ya da case 1...3: deyip direkt default'a geçebiliriz.
    print("it's 1")
case 2:
    print("it's 2")
case 3:
    print("it's 3")
default:
    print("Anything")
}


// MARK: - Breakpoint

print("|||| Breakpoint ||||")


var x = 10

print(x)

x += 1 // Buradaki satıra yani 186 numarısına tıklarsam "Breakpoint" işliyor.

print(x)

