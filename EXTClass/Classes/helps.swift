//
//  helps.swift
//  Pods
//
//  Created by Matías Correnti on 16/3/17.
//
//

import UIKit
import Foundation
import CoreLocation

/// Contiene metodos ayudantes para situaciones.
public struct helps {
    
    /// Crea un CLLocation desde dos cadenas String.
    ///
    /// - Parameters:
    ///   - lat: Número de la Latitud.
    ///   - lng: Número de la longitud.
    /// - Returns: CLLocation creado.
    public func getCLLocation(_ lat: String, lng: String) -> CLLocation {
        return CLLocation(latitude: Double(lat)! as CLLocationDegrees, longitude: Double(lng)! as CLLocationDegrees)
    }
    
}
