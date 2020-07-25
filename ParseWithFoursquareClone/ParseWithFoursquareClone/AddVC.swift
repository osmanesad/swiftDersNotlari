//
//  AddVC.swift
//  ParseWithFoursquareClone
//
//  Created by Osman Esad on 24.07.2020.
//  Copyright © 2020 pixeldigitalart. All rights reserved.
//

import UIKit

class AddVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

// MARK: - Objects
    
    @IBOutlet weak var placenameTextFiled: UITextField!
    @IBOutlet weak var placetypeTextFiled: UITextField!
    @IBOutlet weak var placeatmTextFiled: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
// MARK: - viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.isUserInteractionEnabled = true
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageviewClicked))
        imageView.addGestureRecognizer(gestureRecognizer)

       
    }
    

// MARK: - Next Button
    
    @IBAction func nextBtn(_ sender: Any) {
        
        
        if placenameTextFiled.text != "" && placetypeTextFiled.text != "" && placeatmTextFiled.text != "" {
            if let chosenImage = imageView.image{
                let placemodal = PlaceModal.sharedInstance
                placemodal.placeName = placenameTextFiled.text!
                placemodal.placeType = placetypeTextFiled.text!
                placemodal.placeAtmosphere = placeatmTextFiled.text!
                placemodal.placeImage = chosenImage
            }
            
             performSegue(withIdentifier: "toMapVC", sender: nil)
        } else {
            
            self.makeAlert(titleInput: "Error", messageInput: "Empty box !")
            
            
            
        }
        
       
        
       
        
        
    }
    
// MARK: - imageView Clicked Function
    
    @objc func imageviewClicked() {
        
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        self.present(picker, animated: true, completion: nil)
        
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
        
    }

// MARK: - Alert Message
    
    func makeAlert(titleInput:String, messageInput:String) {
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okBtn = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okBtn)
        self.present(alert, animated: true, completion: nil)
    }
    
    
    
    
}
