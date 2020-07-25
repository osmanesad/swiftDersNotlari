//
//  DetailsVC.swift
//  ParseWithFoursquareClone
//
//  Created by Osman Esad on 24.07.2020.
//  Copyright © 2020 pixeldigitalart. All rights reserved.
//

import UIKit
import MapKit
import Parse

class DetailsVC: UIViewController, MKMapViewDelegate{
    
// MARK: - Objects
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var placenameLabel: UILabel!
    @IBOutlet weak var placetypeLabel: UILabel!
    @IBOutlet weak var placeatmLabel: UILabel!
    @IBOutlet weak var detailsMapView: MKMapView!
    
// MARK: - VAR's
    
    var chosenPlaceId = ""
    var chosenLatitude = Double()
    var chosenLongitude = Double()
    
// MARK: - viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        getDataFromParse()
        detailsMapView.delegate = self
        
    }
    
 // MARK: - getData Functions
    
    func getDataFromParse() {
        
        
        let query = PFQuery(className: "Places")
        query.whereKey("objectId", equalTo: chosenPlaceId)
        query.findObjectsInBackground { (objects, error) in
            if error != nil {
                
                self.makeAlert(titleInput: "Error", messageInput: error?.localizedDescription ?? "Error")
                
            } else {
                
                if objects != nil {
                    if objects!.count > 0 {
                         let chosenPlaceObject = objects![0]
                        
                        if let placeName = chosenPlaceObject.object(forKey: "name") as? String {
                            self.placenameLabel.text = placeName
                        }
                        
                        if let placeType = chosenPlaceObject.object(forKey: "type") as? String {
                            self.placetypeLabel.text = placeType
                        }
                        
                        if let placeAtmosphere = chosenPlaceObject.object(forKey: "atmosphere") as? String {
                            self.placeatmLabel.text = placeAtmosphere
                        }
                        
                        if let placeLatitude = chosenPlaceObject.object(forKey: "latitude") as? String {
                            if let placeLatitudeDouble = Double(placeLatitude) {
                                self.chosenLatitude = placeLatitudeDouble
                            }
                        }
                        
                        if let placeLongitude = chosenPlaceObject.object(forKey: "longitude") as? String {
                            if let placeLongitude = Double(placeLongitude) {
                                self.chosenLongitude = placeLongitude
                            }
                        }
                        
                        if let imageData = chosenPlaceObject.object(forKey: "image") as? PFFileObject {
                            
                            imageData.getDataInBackground { (data, error) in
                                if error == nil {
                                    if data != nil {
                                        self.imageView.image = UIImage(data: data!)
                                    }
                                    
                                    
                                }
                            }
                            
                        }
                        
                        
                        // Map - Harita verisinin gelmesi
                        
                        let location = CLLocationCoordinate2D(latitude: self.chosenLatitude, longitude: self.chosenLongitude)
                        
                        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
                        
                        let region = MKCoordinateRegion(center: location, span: span)
                        
                        self.detailsMapView.setRegion(region, animated: true)
                        
                        let annotation = MKPointAnnotation()
                        annotation.coordinate = location
                        annotation.title = self.placenameLabel.text!
                        annotation.subtitle = self.placetypeLabel.text!
                        self.detailsMapView.addAnnotation(annotation)
                        
                        
                        
                    }
                   
                }
                
            }
        }
        
        
    }
    
// MARK: - Map App - Harita Uygulamasının Açılması - Navigasyon
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        if annotation is MKUserLocation {
            
            return nil
        }
        
        let reuseId = "Pin"
        
        var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId)
        
        if pinView == nil {
            
            pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            pinView?.canShowCallout = true
            let button = UIButton(type: .detailDisclosure)
            pinView?.rightCalloutAccessoryView = button
        
        } else {
            
            pinView?.annotation = annotation
        }
        
        return pinView
    }
    
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        
        if self.chosenLongitude != 0.0 && self.chosenLatitude != 0.0 {
            let requestLocation = CLLocation(latitude: self.chosenLatitude, longitude: self.chosenLongitude)
            CLGeocoder().reverseGeocodeLocation(requestLocation) { (placemarks, error) in
                
                if let placemark = placemarks {
                    if placemark.count > 0 {
                        let mkPlaceMark = MKPlacemark(placemark: placemark[0])
                        let mapItem = MKMapItem(placemark: mkPlaceMark)
                        mapItem.name = self.placenameLabel.text
                        
                        let launchOptions = [MKLaunchOptionsDirectionsModeKey : MKLaunchOptionsDirectionsModeDriving]
                    
                        
                        mapItem.openInMaps(launchOptions: launchOptions)
                    }
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
