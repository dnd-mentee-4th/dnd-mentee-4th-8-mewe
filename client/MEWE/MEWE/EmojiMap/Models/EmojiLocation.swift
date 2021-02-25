//
//  EmojiLocation.swift
//  MEWE
//
//  Created by Keunna Lee on 2021/02/24.
//

import SwiftUI
import MapKit

struct EmojiLocation: Identifiable {
    
    var id = UUID().uuidString
    let card: Card
    let latitude: Double
    let longitude: Double
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
