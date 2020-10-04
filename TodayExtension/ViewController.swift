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
                let lat = placemark?.location?.coordinate.latitude
                let lon = placemark?.location?.coordinate.longitude
                self.defaults.setValue(lat, forKey: "spot0lat")
                self.defaults.setValue(lon, forKey: "spot0lon")
                self.setValue(self.labelText.text!, forKey: "spot0name")
                self.setValue(self.streetLabel.text!, forKey: "spot0street")
                self.setValue(true, forKey: "spot0set")
            }
            return
        } else if spotControl.selectedSegmentIndex == 1 {
            geocoder.geocodeAddressString(address) { placemarks, error in
                let placemark = placemarks?.first
                let lat = placemark?.location?.coordinate.latitude
                let lon = placemark?.location?.coordinate.longitude
                self.defaults.setValue(lat, forKey: "spot1lat")
                self.defaults.setValue(lon, forKey: "spot1lon")
                self.setValue(self.labelText.text!, forKey: "spot1name")
                self.setValue(self.streetLabel.text!, forKey: "spot1street")
                self.setValue(true, forKey: "spot1set")
            }
            return
        } else if spotControl.selectedSegmentIndex == 2 {
            geocoder.geocodeAddressString(address) { placemarks, error in
                let placemark = placemarks?.first
                let lat = placemark?.location?.coordinate.latitude
                let lon = placemark?.location?.coordinate.longitude
                self.defaults.setValue(lat, forKey: "spot2lat")
                self.defaults.setValue(lon, forKey: "spot2lon")
                self.setValue(self.labelText.text!, forKey: "spot2name")
                self.setValue(self.streetLabel.text!, forKey: "spot0street")
                
                //Not sure if this will work. Needs test
                UserDefaults.standard.bool(forKey: "spot2set")
                        
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
            print("Hi")
            if (defaults.object(forKey: "spot0set") != nil) == true {
                self.labelText.text = (defaults.object(forKey: "spot0name") as! String)
                self.streetLabel.text = (defaults.object(forKey: "spot0street") as! String)
                // Needs to add Map intregation
                
            }

        case 1:
            print("Bye")

        default:
            print("Nothing")
        }
    }
    //TEST

    
//    func testConversion() {
//        let address = "1 Infinite Loop 95014"
//
//        let geocoder = CLGeocoder()
//        geocoder.geocodeAddressString(address) { placemarks, error in
//            let placemark = placemarks?.first
//            let lat = placemark?.location?.coordinate.latitude
//            let lon = placemark?.location?.coordinate.longitude
//            print("Lat: \(lat), Lon: \(lon)")
//    let annotation = MKPointAnnotation()
//    let centerCoordinate = CLLocationCoordinate2D(latitude: 41, longitude:29)
//    annotation.coordinate = centerCoordinate
//    annotation.title = "labelText.text"
//    mapView.addAnnotation(annotation)
//
//
//        }
//    }
}

