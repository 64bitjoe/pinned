//
//  ViewController.swift
//  TodayExtension
//
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var carImage: UIImageView!
    @IBOutlet weak var labelText: UITextField!
    @IBOutlet weak var streetLabel: UITextField!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var spotControl: UISegmentedControl!
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
		super.viewDidLoad()
        
        self.labelText.delegate = self
        self.streetLabel.delegate = self
        mapView.layer.cornerRadius = 5
        
        let imageIcon = UIImage(systemName: "mappin.circle")?.withTintColor(.red, renderingMode: .alwaysOriginal)
            carImage.image = imageIcon
        if (defaults.object(forKey: "spot0set") != nil) == true {
            self.spotControl.setTitle(defaults.object(forKey: "spot0name") as? String, forSegmentAt: 0)
        }
        if (defaults.object(forKey: "spot1set") != nil) == true {
            self.spotControl.setTitle(defaults.object(forKey: "spot1name") as? String, forSegmentAt: 1)
        }
        if (defaults.object(forKey: "spot2set") != nil) == true {
            self.spotControl.setTitle(defaults.object(forKey: "spot2name") as? String, forSegmentAt: 2)
        }
        
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
    
	}

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    //RENAME THIS
    
    //Error Handeling needed
    @IBAction func streetAdressAdded(_ sender: Any) {
        
        let address = streetLabel.text!
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(address) { placemarks, error in
            let placemark = placemarks?.first
            let lat = placemark?.location?.coordinate.latitude
            let lon = placemark?.location?.coordinate.longitude
            
            let mapCenter = CLLocationCoordinate2DMake(lat!, lon!)
            let span = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
            let region = MKCoordinateRegion(center: mapCenter, span: span)
            self.mapView.region = region

            let annotation = MKPointAnnotation()
            let centerCoordinate = CLLocationCoordinate2D(latitude: lat!, longitude:lon!)
                annotation.coordinate = centerCoordinate
            annotation.title = self.labelText.text
            self.mapView.addAnnotation(annotation)
            
        }
    }
    
    //Save data entered with error correction
    @IBAction func saveButtonPressed(_ sender: Any) {
        let address = streetLabel.text!
        let geocoder = CLGeocoder()
        
        if spotControl.selectedSegmentIndex == 0 {
            geocoder.geocodeAddressString(address) { placemarks, error in
                let placemark = placemarks?.first
                let lat = placemark?.location?.coordinate.latitude.description
                let lon = placemark?.location?.coordinate.longitude.description
                UserDefaults.standard.setValue(lat, forKey: "spot0lat")
                UserDefaults.standard.setValue(lon, forKey: "spot0lon")
                UserDefaults.standard.setValue(self.labelText.text!, forKey: "spot0name")
                UserDefaults.standard.setValue(self.streetLabel.text!, forKey: "spot0street")
                UserDefaults.standard.setValue(true, forKey: "spot0set")
                self.spotControl.setTitle(self.labelText.text!, forSegmentAt: 0)
            }
            return
        } else if spotControl.selectedSegmentIndex == 1 {
            geocoder.geocodeAddressString(address) { placemarks, error in
                let placemark = placemarks?.first
                let lat = placemark?.location?.coordinate.latitude.description
                let lon = placemark?.location?.coordinate.longitude.description
                UserDefaults.standard.setValue(lat, forKey: "spot1lat")
                UserDefaults.standard.setValue(lon, forKey: "spot1lon")
                UserDefaults.standard.setValue(self.labelText.text!, forKey: "spot1name")
                UserDefaults.standard.setValue(self.streetLabel.text!, forKey: "spot1street")
                UserDefaults.standard.setValue(true, forKey: "spot1set")
                self.spotControl.setTitle(self.labelText.text!, forSegmentAt: 1)
            }
            return
        } else if spotControl.selectedSegmentIndex == 2 {
            geocoder.geocodeAddressString(address) { placemarks, error in
                let placemark = placemarks?.first
                let lat = placemark?.location?.coordinate.latitude.description
                let lon = placemark?.location?.coordinate.longitude.description
                UserDefaults.standard.setValue(lat, forKey: "spot2lat")
                UserDefaults.standard.setValue(lon, forKey: "spot2lon")
                UserDefaults.standard.setValue(self.labelText.text!, forKey: "spot2name")
                UserDefaults.standard.setValue(self.streetLabel.text!, forKey: "spot2street")
                UserDefaults.standard.setValue(true, forKey: "spot2set")
                self.spotControl.setTitle(self.labelText.text!, forSegmentAt: 2)
            }
            return
        }
    }
    // Setup Callback of data stored or Nil data
    /*Started adding code for check for nil data
     
 */
    @IBAction func valueChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
        
            if (defaults.object(forKey: "spot0set") != nil) == true {
                self.labelText.text = (defaults.object(forKey: "spot0name") as! String)
                self.streetLabel.text = (defaults.object(forKey: "spot0street") as! String)
                // Needs to add Map intregation
                
                print("Hi")
                
                let geocoder = CLGeocoder()
                let address = defaults.object(forKey: "spot0street") as! String
                geocoder.geocodeAddressString(address) { placemarks, error in
                    let placemark = placemarks?.first
                    let lat = placemark?.location?.coordinate.latitude
                    let lon = placemark?.location?.coordinate.longitude
                    
                    let mapCenter = CLLocationCoordinate2DMake(lat!, lon!)
                    let span = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
                    let region = MKCoordinateRegion(center: mapCenter, span: span)
                    self.mapView.region = region

                    let annotation = MKPointAnnotation()
                    let centerCoordinate = CLLocationCoordinate2D(latitude: lat!, longitude:lon!)
                        annotation.coordinate = centerCoordinate
                    annotation.title = self.labelText.text
                    self.mapView.addAnnotation(annotation)
                    
                }
            }

        case 1:
            if (defaults.object(forKey: "spot1set") != nil) == true {
                self.labelText.text = (defaults.object(forKey: "spot1name") as! String)
                self.streetLabel.text = (defaults.object(forKey: "spot1street") as! String)

                let geocoder = CLGeocoder()
                let address = defaults.object(forKey: "spot1street") as! String
                geocoder.geocodeAddressString(address) { placemarks, error in
                    let placemark = placemarks?.first
                    let lat = placemark?.location?.coordinate.latitude
                    let lon = placemark?.location?.coordinate.longitude
                    
                    let mapCenter = CLLocationCoordinate2DMake(lat!, lon!)
                    let span = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
                    let region = MKCoordinateRegion(center: mapCenter, span: span)
                    self.mapView.region = region

                    let annotation = MKPointAnnotation()
                    let centerCoordinate = CLLocationCoordinate2D(latitude: lat!, longitude:lon!)
                        annotation.coordinate = centerCoordinate
                    annotation.title = self.labelText.text
                    self.mapView.addAnnotation(annotation)
                    
                }
            }


        default:
            print("Nothing")
        }
    }

}

