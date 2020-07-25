//
//  ViewController.swift
//  MachineLearning
//
//  Created by Osman Esad on 25.07.2020.
//  Copyright © 2020 pixeldigitalart. All rights reserved.
//

import UIKit
import CoreML
import Vision

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
// MARK: - Objects
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var changeLabel: UILabel!
    
// MARK: - VAR's
    
    var chosenImage = CIImage()
    
    
    
// MARK: - viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        
        
    }
    
// MARK: - Change Button
    
    
    @IBAction func changeButton(_ sender: Any) {
        
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        present(picker, animated: true, completion: nil)
        
        
        
    }
    
    
    
    
    
    
// MARK: - Fucntions
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
        
        if let ciImage = CIImage(image: imageView.image!) {
            chosenImage = ciImage
        }
        
        recognizeImage(image: chosenImage)
        
    }
    
    
    func recognizeImage(image: CIImage){
        
        changeLabel.text = "Hmm what is.."
        
        if let model = try?  VNCoreMLModel(for: MobileNetV2().model ) {
            
            let request = VNCoreMLRequest(model: model) { (vnrequest, error) in
                if let results = vnrequest.results as? [VNClassificationObservation] {
                    if results.count > 0 {
                        let topresult = results.first
                        
                        DispatchQueue.main.async {
                            
                            let confidenceLevel = (topresult?.confidence ?? 0) * 100
                            
                            let rounded = Int (confidenceLevel * 100) / 100
                            
                            self.changeLabel.text = "\(rounded)% it's \(topresult!.identifier)"
                            
                        }
                    }
                }
            }
            
            let handler = VNImageRequestHandler(ciImage: image)
                  DispatchQueue.global(qos: .userInteractive).async {
                    do {
                    try handler.perform([request])
                    } catch {
                        
                        self.makeAlert(titleInput: "Error", messageInput: error.localizedDescription)
                    }
            
        }
        
      
        }
        
    }
    
    
    
// MARK: - Alert Message
    
    func makeAlert(titleInput:String, messageInput:String) {
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okBtn = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okBtn)
        self.present(alert, animated: true, completion: nil)
    }
    


}

