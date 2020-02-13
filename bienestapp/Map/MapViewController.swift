//
//  MapViewController.swift
//  bienestapp
//
//  Created by alumnos on 13/02/2020.
//  Copyright © 2020 alumnos. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    @IBOutlet weak var mapita: MKMapView!

    let manager = CLLocationManager()
    var currentCoordinate: CLLocationCoordinate2D?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getPlaces()
        
        if CLLocationManager.locationServicesEnabled() {
            manager.delegate = self
            manager.requestWhenInUseAuthorization()
            manager.desiredAccuracy = kCLLocationAccuracyBest
            manager.distanceFilter = kCLDistanceFilterNone
            manager.startUpdatingLocation()

        }
        mapita.showsUserLocation = true
        mapita.showsCompass = true
        mapita.showsScale = true
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        
        let currentLocation = CLLocation(latitude: locValue.latitude, longitude: locValue.longitude)
        
        let regionRadius: CLLocationDistance = 4000.0
        
        let region = MKCoordinateRegion(center: currentLocation.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        
        mapita.setRegion(region, animated: true)
    }
    func getPlaces() {
        
            self.createAnnotations()
        
    }

    func createAnnotations() {
        
    
        let latitudes = map_data?.latitude.count
        let longitudes = map_data?.altitude.count
        
        for i in 0...((map_data?.latitude.count)!-1) {
            let annotation = MKPointAnnotation()
            
            annotation.title = map_data?.name[i]
            annotation.subtitle = map_data?.name[i]
            
            annotation.coordinate = CLLocationCoordinate2D(
                latitude: (map_data?.latitude[i])!,
                longitude: (map_data?.altitude[i])!)
            
            self.mapita.addAnnotation(annotation)
        }
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        print(view.annotation?.title! as Any)
    }
}

