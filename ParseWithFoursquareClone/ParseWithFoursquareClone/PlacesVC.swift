//
//  PlacesVC.swift
//  ParseWithFoursquareClone
//
//  Created by Osman Esad on 24.07.2020.
//  Copyright © 2020 pixeldigitalart. All rights reserved.
//

import UIKit
import Parse

class PlacesVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
 
// MARK: - VAR's
    
    var placeNameArray = [String]()
    var placeIdArray = [String]()
    var selectedPlaceId = ""
    
    
    
// MARK: - TableView Functions
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return placeNameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = placeNameArray[indexPath.row]
        return cell
    }
    
    
// MARK: - Objects
    
    @IBOutlet weak var tableView: UITableView!
    
// MARK: - viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        getDataFromParse()

// MARK: - Add Button - Navigation
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(addButtonClicked))
        
// MARK: - Logout Button - Navigation
        
        navigationController?.navigationBar.topItem?.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: UIBarButtonItem.Style.plain, target: self, action: #selector(logoutButtonClicked))
        
    }
    
// MARK: - Add Function
    
    @objc func addButtonClicked() {
        
        self.performSegue(withIdentifier: "toAddVC", sender: nil)
        
        
    }
    
// MARK: - Logout Function
    
    @objc func logoutButtonClicked() {
        
        PFUser.logOutInBackground { (error) in
            if error != nil {
                self.makeAlert(titleInput: "Error", messageInput: error?.localizedDescription ?? "Error")
            } else {
                
                self.performSegue(withIdentifier: "toSingupVC", sender: nil)
                
            }
        }
        
    }
    
    
 // MARK: - GetData - Veri çek
    
    func getDataFromParse(){
        
        let query = PFQuery(className: "Places")
        query.findObjectsInBackground { (objects, error) in
            if error != nil {
                
                self.makeAlert(titleInput: "Error", messageInput: error?.localizedDescription ?? "Error")
                
            } else {
                
                if objects != nil {
                    
                    
                    // Önemli !! Üst üste verileri yenilememesi için.
                    self.placeNameArray.removeAll(keepingCapacity: false)
                    self.placeIdArray.removeAll(keepingCapacity: false)
                    
                    for object in objects! {
                        if let placeName = object.object(forKey: "name") as? String {
                            if let placeId = object.objectId {
                                self.placeNameArray.append(placeName)
                                self.placeIdArray.append(placeId)
                            }
                        }
                    }
                    
                    self.tableView.reloadData() // Önemli !! Verilerin tabloda görülebilmesi için.
                    
                }
                
            }
        }
        
    }
    
    
    
// MARK: - Tableview Clicked - Tablodaki nesnelere tıklanınca olacak işlemler
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toDetailsVC" {
            let destinationVC = segue.destination as! DetailsVC
            destinationVC.chosenPlaceId = selectedPlaceId
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedPlaceId =  placeIdArray[indexPath.row]
        self.performSegue(withIdentifier: "toDetailsVC", sender: nil)
        
    }
    
    
    
    
// MARK: - Alert Message
    
    func makeAlert(titleInput:String, messageInput:String) {
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okBtn = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okBtn)
        self.present(alert, animated: true, completion: nil)
    }
    
   
}
