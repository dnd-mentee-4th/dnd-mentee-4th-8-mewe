//
//  MapViewModel.swift
//  MEWE
//
//  Created by Keunna Lee on 2021/02/24.
//

import SwiftUI
import MapKit
import CoreLocation

class MapViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    @Published var mapView = MKMapView()
    @Published var permissionDenied = false
    @Published var isCardShown = false
    @Published var mapType: MKMapType = .standard
    @Published var searchText = ""
    @State var region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 37.532600, longitude: 127.024612),
            span: MKCoordinateSpan(latitudeDelta: 0.075, longitudeDelta: 0.075))
    @Published var places: [EmojiLocation] = [
        EmojiLocation(card: Card.example, latitude: 37.532600, longitude: 127.034612),
        EmojiLocation(card: Card.example, latitude: 37.533600, longitude: 127.014612),
        EmojiLocation(card: Card.example, latitude: 37.532700, longitude: 127.036612)
    ]
    
    func updateMapType() {
        if mapType == .standard {
            mapType = .hybrid
            mapView.mapType = mapType
        } else {
            mapType = .standard
            mapView.mapType = mapType
        }
    }
    
    func focusLocation() {
        mapView.setRegion(region, animated: true)
        mapView.setVisibleMapRect(mapView.visibleMapRect, animated: true)
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        // checking permission
        switch manager.authorizationStatus {
        case .denied: permissionDenied.toggle()
        case .notDetermined: manager.requestWhenInUseAuthorization()
        case .authorizedWhenInUse:
            // if permission given
            manager.requestLocation()
        default:
            ()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        #if DEBUG
        print(error.localizedDescription)
        #endif
    }
    
    // getting user region
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        self.region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 10000, longitudinalMeters: 10000)
        
        // updating map
        self.mapView.setRegion(self.region, animated: true)
        
        // smooth animations
        self.mapView.setVisibleMapRect(self.mapView.visibleMapRect, animated: true)
    }
}
