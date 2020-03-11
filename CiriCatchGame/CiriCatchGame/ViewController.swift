//
//  ViewController.swift
//  CiriCatchGame
//
//  Created by Osman Esad on 1.03.2020.
//  Copyright © 2020 pixeldigitalart. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ciri1: UIImageView!
    @IBOutlet weak var ciri2: UIImageView!
    @IBOutlet weak var ciri3: UIImageView!
    @IBOutlet weak var ciri4: UIImageView!
    @IBOutlet weak var ciri5: UIImageView!
    @IBOutlet weak var ciri6: UIImageView!
    @IBOutlet weak var ciri7: UIImageView!
    @IBOutlet weak var ciri8: UIImageView!
    @IBOutlet weak var ciri9: UIImageView!
    @IBOutlet weak var timer: UILabel!
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var highscore: UILabel!
    
    
    
    var myScore = 0
    var myTimer = Timer()
    var counter = 0
    var ciriArray = [UIImageView]()
    var hideTimer = Timer()
    var hScore = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        score.text = "Skor: \(myScore)"
        
        
        let storedHighScore = UserDefaults.standard.object(forKey: "highscore")
        
        if storedHighScore == nil {
            hScore = 0
            highscore.text = "En Yüksek Skor: \(hScore)"
        }
        
        if let newScore = storedHighScore as? Int {
            hScore = newScore
            highscore.text = "En Yüksek Skor: \(hScore)"
        }
        
        ciri1.isUserInteractionEnabled = true
        ciri2.isUserInteractionEnabled = true
        ciri3.isUserInteractionEnabled = true
        ciri4.isUserInteractionEnabled = true
        ciri5.isUserInteractionEnabled = true
        ciri6.isUserInteractionEnabled = true
        ciri7.isUserInteractionEnabled = true
        ciri8.isUserInteractionEnabled = true
        ciri9.isUserInteractionEnabled = true
        
        let recognizer1 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer2 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer3 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer4 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer5 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer6 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer7 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer8 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer9 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        
        ciri1.addGestureRecognizer(recognizer1)
        ciri2.addGestureRecognizer(recognizer2)
        ciri3.addGestureRecognizer(recognizer3)
        ciri4.addGestureRecognizer(recognizer4)
        ciri5.addGestureRecognizer(recognizer5)
        ciri6.addGestureRecognizer(recognizer6)
        ciri7.addGestureRecognizer(recognizer7)
        ciri8.addGestureRecognizer(recognizer8)
        ciri9.addGestureRecognizer(recognizer9)
        
        ciriArray = [ciri1, ciri2, ciri3, ciri4, ciri5, ciri6, ciri7, ciri8, ciri9]
        
        
        
        // Timers
        
        counter = 10
        timer.text = "\(counter)"
        
        
        myTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countDown), userInfo: nil, repeats: true)
        hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(hideCiri), userInfo: nil, repeats: true)
        hideCiri()
        
    }
    
    
    @objc func hideCiri() {
        
        for ciri in ciriArray {
            ciri.isHidden = true
        }
        
        let random = Int(arc4random_uniform(UInt32(ciriArray.count - 1)))
        ciriArray[random].isHidden = false
        
        
    }
    
    
    @objc func increaseScore(){
        myScore += 1
        score.text = "Skor: \(myScore)"
        
    }
    
    @objc func countDown(){
        
        counter -= 1
        timer.text = String(counter)
        
        if counter == 0 {
            
            myTimer.invalidate()
            hideTimer.invalidate()
            
            for ciri in ciriArray {
                       ciri.isHidden = true
                   }
            
            if self.myScore > self.hScore {
                
                self.hScore = self.myScore
                highscore.text = "En Yüksek Skor: \(self.hScore)"
                UserDefaults.standard.set(self.hScore, forKey: "highscore")
            }
            
            let alert = UIAlertController(title: "Zaman doldu kardeş", message: "Yeniden dene Gardaş", preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "Bitir", style: UIAlertAction.Style.cancel, handler: nil)
            let replayButton = UIAlertAction(title: "Bir daha dene", style: UIAlertAction.Style.default) { (UIAlertAction) in
                
                self.myScore = 0
                self.score.text = "Score: \(self.myScore)"
                self.counter = 10
                self.timer.text = String(self.counter)
                
                
                self.myTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.countDown), userInfo: nil, repeats: true)
                self.hideTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.hideCiri), userInfo: nil, repeats: true)
        
            }
            
            alert.addAction(okButton)
            alert.addAction(replayButton)
            self.present(alert, animated: true, completion: nil)
            
        }
        
    }
    
    

}

