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
    /*
    /// Crea un CLLocation desde dos cadenas String.
    ///
    /// - Parameters:
    ///   - lat: Número de la Latitud.
    ///   - lng: Número de la longitud.
    /// - Returns: CLLocation creado.
    public func getCLLocation(_ lat: String, lng: String) -> CLLocation {
        return CLLocation(latitude: Double(lat)! as CLLocationDegrees, longitude: Double(lng)! as CLLocationDegrees)
    }
    
    /**
     Optiene la distancia en número del usuario al comercio (Lo calcula mediante CoreLocation del celular).
     
     - author: Correnti
     
     - parameter lat: Latitud.
     - parameter lng: Longitud.
     
     - returns: Distancia que hay a las coordenadas.
     */
    func getDistanciaSucursal(_ lat: String, lng: String) -> Double {
        let finalLocation = CLLocation(latitude: Double(lat)!, longitude: Double(lng)!)
        let loc = getLocGPS()
        let startLocation = CLLocation(latitude: (loc?.coordinate.latitude)!, longitude: (loc?.coordinate.longitude)!)
        
        let distancia: CLLocationDistance = startLocation.distance(from: finalLocation)
        
        let kilometros = distancia/1000
        //        let code = "\(String(format: "%.2f", distancia)) metros\n\(String(format: "%.3f", kilometros)) kilometros"
        
        return kilometros
    }
    */
    
    
    /// Regresa un rect con el tamaño del lado más chico de otro.
    ///
    /// - Parameter rect: Rectángulo.
    /// - Returns: Nuevo rectángulo.
    func calcularTamaño(_ rect: CGSize) -> CGSize {
        var res = rect
        if rect.height < rect.width {
            res.height = rect.width
        } else if rect.width < rect.height {
            res.width = rect.height
        }
        return res
    }
    
    /// Cantidad de páginas según la cantidad de filas que se muestran por página. (Trabaja en base 0)
    ///
    /// - Parameters:
    ///   - totalPagina: Cantidad de filas por página.
    ///   - total: Cantidad total de filas.
    /// - Returns: Número de páginas necesarias para mostrar todas las filas.
    func cantidadPaginas(_ totalPagina: Int, total: Int) -> Int {
        var paginas: Int = 0 //El 0 representa la primer página.
        paginas = Int(ceil(CGFloat(total)/CGFloat(totalPagina)))
        return paginas-1
    }
    
    /// Borra o reemplaza una cadena de texto dentro de otro texto.
    ///
    /// - Parameters:
    ///   - original: Texto donde buscar.
    ///   - buscar: Texto a buscar.
    ///   - reemplazo: Texto con el cual reemplazar el texto buscado si se lo encuentra.
    /// - Returns: Texto nuevo modificado.
    func borrar(text original: String, buscar: String, reemplazo: String = "") -> String {
        var texto: String = original
        let mr = matchesForRegexInText("\(buscar)", text: texto)
        if mr.count > 0 {
            for itemR in mr {
                let rangos = texto.rangesOfString(itemR, textoExacto: false)
                let rever = rangos.reversed()
                for itemG in rever {
                    let nsRango = texto.nsRange(from: itemG)
                    let nsString = texto as NSString
                    texto = nsString.replacingCharacters(in: nsRango, with: reemplazo)
                }
            }
        }
        return texto
    }
    
    /// Guarda información en el Dispositivo.
    ///
    /// - Parameters:
    ///   - data: Información.
    ///   - forKey: Key donde guardar.
    func saveData_Device(data: String, forKey: String) {
        let user = UserDefaults.standard
        if user.string(forKey: forKey) != nil {
            user.set(data, forKey: forKey)
        } else {
            user.set(data, forKey: forKey)
        }
    }
    
    /// Recupera información guardada en el Dispositivo.
    ///
    /// - Parameter forKey: Key donde buscar.
    /// - Returns: Información guardada o nil si no existe.
    func getData_Device(ForKey forKey: String) -> String! {
        let user = UserDefaults.standard
        if let dato = user.string(forKey: forKey) {
            return dato
        }
        return nil
    }
    
    /// Busca mediante expresion regular dentro de una cadena.
    ///
    /// - Parameters:
    ///   - regex: Expresion regular usada para buscar.
    ///   - text: Texto donde buscar.
    /// - Returns: Coincidencias encontradas.
    func matchesForRegexInText(_ regex: String!, text: String!) -> [String] {
        do {
            let regex = try NSRegularExpression(pattern: regex, options: [])
            let nsString = text as NSString
            let results = regex.matches(in: text, options: [], range: NSMakeRange(0, nsString.length))
            return results.map { nsString.substring(with: $0.range)}
        } catch let error as NSError {
            NSLog("Invalid regex: %@", error.localizedDescription)
            return []
        }
    }
    
    /// Versión actual de la App.
    ///
    /// - Returns: String
    func getAppVersion() -> NSString {
        return (Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! NSString)
    }
    
}
