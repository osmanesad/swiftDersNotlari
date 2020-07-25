//
//  MapVC.swift
//  ParseWithFoursquareClone
//
//  Created by Osman Esad on 24.07.2020.
//  Copyright © 2020 pixeldigitalart. All rights reserved.
//

import UIKit
import MapKit
import Parse

class MapVC: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
// MARK: - Objects
    
    @IBOutlet weak var mapView: MKMapView!
    
    
// MARK: - VAR's
    
    var locationManager = CLLocationManager()
    
    
// MARK: - viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        let recognizer = UILongPressGestureRecognizer(target: self, action: #selector(chooseLocation(gestureRecognizer:)))
        recognizer.minimumPressDuration = 3
        mapView.addGestureRecognizer(recognizer)
        
        
// MARK: - Save Button - Navigation
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(title: "Save", style: UIBarButtonItem.Style.plain, target: self, action: #selector(saveButtonClicked))
        
// MARK: - Back Button - Navigation
        
        navigationController?.navigationBar.topItem?.leftBarButtonItem = UIBarButtonItem(title: "Back", style: UIBarButtonItem.Style.plain, target: self, action: #selector(backButtonClicked))

       
    }
    
// MARK: - Lokasyon İşlemleri
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = CLLocationCoordinate2D(latitude: locations[0].coordinate.latitude, longitude: locations[0].coordinate.longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
        let region = MKCoordinateRegion(center: location, span: span)
        mapView.setRegion(region, animated: true)
    }
    

// MARK: - Save Function
    
    @objc func saveButtonClicked() {
        
        let placeModal = PlaceModal.sharedInstance
        
        let object = PFObject(className: "Places")
        object["name"] = placeModal.placeName
        object["type"] = placeModal.placeType
        object["atmosphere"] = placeModal.placeAtmosphere
        object["latitude"] = placeModal.placeLatitude
        object["longitude"] = placeModal.placeLongitude
        
        
        if let imageData = placeModal.placeImage.jpegData(compressionQuality: 0.5) {
            object["image"] = PFFileObject(name: "image.jpg", data: imageData)
            
        }
        
        object.saveInBackground { (succes, error) in
            if error != nil {
                
                self.makeAlert(titleInput: "Error", messageInput: error?.localizedDescription ?? "Error")
                
            } else {
                self.performSegue(withIdentifier: "toFromMapVCtoPlacesVC", sender: nil)
                
            }
        }
        
        
        
    }
    
// MARK: - Back Function
    
    @objc func backButtonClicked() {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
// MARK: - Long Press - Location select on map
    
    @objc func chooseLocation(gestureRecognizer: UIGestureRecognizer) {
        
        if gestureRecognizer.state == UIGestureRecognizer.State.began {
            
            let touches = gestureRecognizer.location(in: self.mapView)
            let cordinates = self.mapView.convert(touches, toCoordinateFrom: self.mapView)
            let annotation = MKPointAnnotation()
            annotation.coordinate = cordinates
            annotation.title = PlaceModal.sharedInstance.placeName
            annotation.subtitle = PlaceModal.sharedInstance.placeType
            
            self.mapView.addAnnotation(annotation)
            
            PlaceModal.sharedInstance.placeLatitude = String(cordinates.latitude)
            PlaceModal.sharedInstance.placeLongitude = String(cordinates.longitude)
            
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
