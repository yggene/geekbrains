//
//  ViewController.swift
//  MapsApp
//
//  Created by Evgeny Alekseev on 15.05.2022.
//

import UIKit
import GoogleMaps

class MapViewController: UIViewController {
    
    // Outlets
    @IBOutlet var mapView: GMSMapView!
    
    // Constants
    let coordinate = CLLocationCoordinate2D(latitude: 37.34033264974476, longitude: -122.06892632102273)
    
    // Variables
    var marker: GMSMarker?
    var geoCoder: CLGeocoder?
    var locationManager: CLLocationManager?
    var route: GMSPolyline?
    var routePath: GMSMutablePath?
    
    // Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureMap()
        configureLocationManager()
    }
    
    private func configureMap() {
        let camera = GMSCameraPosition.camera(withTarget: coordinate, zoom: 17.0)
        mapView.camera = camera
        mapView.isMyLocationEnabled = true
        mapView.delegate = self
    }
    
    private func configureLocationManager() {
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.requestWhenInUseAuthorization()
        locationManager?.allowsBackgroundLocationUpdates = true
    }
     
    @IBAction func didTapAddMarkerButton(_ sender: Any) {
        //marker == nil ? addMarker() : removeMarker()
        if marker == nil {
            mapView.animate(toLocation: coordinate)
            addMarker()
        } else {
            removeMarker()
        }
    }
    
    @IBAction func didTapRequestLocation(_ sender: Any) {
        locationManager?.requestLocation()
        
        route?.map = nil
        route = GMSPolyline()
        routePath = GMSMutablePath()
        
        route?.map = mapView
        
        locationManager?.startUpdatingLocation()
    }
    
    private func addMarker() {
        marker = GMSMarker(position: coordinate)
        marker?.icon = GMSMarker.markerImage(with: .cyan)
        marker?.title = "I'm the Marker"
        marker?.snippet = "Watch me mark!"
        marker?.map = mapView
    }
    
    private func removeMarker() {
        marker?.map = nil
        marker = nil
    }
    
}

extension MapViewController: GMSMapViewDelegate {
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        print(coordinate)
        let manualMarker = GMSMarker(position: coordinate)
        manualMarker.map = mapView
        
        if geoCoder == nil {
            geoCoder = CLGeocoder()
        }
        
        geoCoder?.reverseGeocodeLocation(CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)) { places, error in
            print(places?.last)
        }
    }
}

extension MapViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        
        routePath?.add(location.coordinate)
        route?.path = routePath
        
        let position = GMSCameraPosition.camera(withTarget: location.coordinate, zoom: 15.0)
        mapView.animate(to: position)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
}
