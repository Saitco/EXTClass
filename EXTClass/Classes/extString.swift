//
//  extString.swift
//  Pods
//
//  Created by Matías Correnti on 18/3/17.
//
//

import UIKit

extension String {
    
    /// Borra o reemplaza una cadena de texto dentro de otro texto.
    ///
    /// - Parameters:
    ///   - original: Texto donde buscar.
    ///   - buscar: Texto a buscar.
    ///   - reemplazo: Texto con el cual reemplazar el texto buscado si se lo encuentra.
    /// - Returns: Texto nuevo modificado.
    public func borrar(expresionRegular buscar: String, reemplazo: String = "") -> String {
        var texto: String = self
        let ss = texto.matchesForRegexInText("\(buscar)")
        if ss.count > 0 {
            for itemR in ss {
                if itemR != "" {
                    let rangos = texto.rangesOfString(itemR, textoExacto: false)
                    let dd = rangos.reversed()
                    for itemG in dd {
                        let nsRango = texto.nsRange(from: itemG)
                        
                        let nsString = texto as NSString
                        texto = nsString.replacingCharacters(in: nsRango, with: reemplazo)
                    }
                }
            }
        }
        return texto
    }
    
    /// Busca mediante una expresion regular dentro de la cadena.
    ///
    /// - Parameter regex: Expresion regular usada para buscar.
    /// - Returns: Coincidencias encontradas.
    public func matchesForRegexInText(_ regex: String!) -> [String] {
        do {
            let regex = try NSRegularExpression(pattern: regex, options: [])
            let nsString = self as NSString
            let results = regex.matches(in: self, options: [], range: NSMakeRange(0, nsString.length))
            return results.map { nsString.substring(with: $0.range)}
        } catch let error as NSError {
            NSLog("Invalid regex: %@", error.localizedDescription)
            return []
        }
    }
    
    /// <#Description#>
    ///
    /// - Parameters:
    ///   - s: <#s description#>
    ///   - textoExacto: <#textoExacto description#>
    /// - Returns: <#return value description#>
    public func rangesOfString(_ s: String, textoExacto: Bool) -> [Range<Index>] {
        if textoExacto {
            let re = try! NSRegularExpression(pattern: NSRegularExpression.escapedPattern(for: s), options: [])
            return re.matches(in: self, options: [], range: nsRange(from: startIndex ..< endIndex)).flatMap { range(from: $0.range) }
        } else {
            let re = try! NSRegularExpression(pattern: NSRegularExpression.escapedPattern(for: s), options: [.caseInsensitive])
            return re.matches(in: self, options: [], range: nsRange(from: startIndex ..< endIndex)).flatMap { range(from: $0.range) }
        }
    }
    
    //Para Swift3
    
    /// <#Description#>
    ///
    /// - Parameter nsRange: <#nsRange description#>
    /// - Returns: <#return value description#>
    public func range(from nsRange: NSRange) -> Range<String.Index>? {
        guard
            let from16 = utf16.index(utf16.startIndex, offsetBy: nsRange.location, limitedBy: utf16.endIndex),
            let to16 = utf16.index(from16, offsetBy: nsRange.length, limitedBy: utf16.endIndex),
            let from = String.Index(from16, within: self),
            let to = String.Index(to16, within: self)
            else { return nil }
        return from ..< to
    }
    
    //Para Swift3
    
    /// <#Description#>
    ///
    /// - Parameter range: <#range description#>
    /// - Returns: <#return value description#>
    public func nsRange(from range: Range<String.Index>) -> NSRange {
        let utf16view = self.utf16
        let from = range.lowerBound.samePosition(in: utf16view)
        let to = range.upperBound.samePosition(in: utf16view)
        return NSMakeRange(utf16view.distance(from: utf16view.startIndex, to: from),
                           utf16view.distance(from: from, to: to))
    }
    
    
    /// Elimina todos los espacios en blanco que se encuentran al final de una cadena.
    ///
    /// - Returns: La cadena sin los espacios al final.
    public func removeLastsEspacios() -> String {
        //TODO: Mejorar
        var returns = self
        var analizar = true
        while analizar {
            if returns.characters.last == " " {
                returns = returns.substring(with: returns.startIndex..<returns.characters.index(before: returns.endIndex))
            } else {
                analizar = false
            }
        }
        return returns
    }
    
    /// Convierte una cadena con el formato "3:4" a un CGFloat (Usar para los NSLayoutConstraint aspect de las imagenes).
    ///
    /// - Returns: Su equivalente en CGFloat.
    public func aspectToCGFloat() -> CGFloat {
        let valor = self.components(separatedBy: ":")
        return CGFloat((valor[0] as NSString).floatValue)/CGFloat((valor[1] as NSString).floatValue)
    }
    
    /// Largo del String.
    public var length: Int {
        return self.characters.count
    }
    
    /// Buscar mediante index.
    ///
    /// - Parameter i: Posición a buscar.
    subscript (i: Int) -> Character {
        return self[self.characters.index(self.startIndex, offsetBy: i)]
    }
    
    /// Buscar mediante index.
    ///
    /// - Parameter i: Posición a buscar.
    subscript (i: Int) -> String {
        return String(self[i] as Character)
    }
    
    /// Convierte un string a NSDate, si no puede regresa la fecha e hoy.
    ///
    /// - Returns: Un NSDate.
    public func convertirAFecha() -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy, HH:mm:ss"
        if let fechaSalida = formatter.date(from: self) {
            return fechaSalida
        }
        return Date()
    }
    
    /// Aplica formato personalizado a la cadena (3 a 03).
    ///
    /// - Returns: Cadena modificada.
    public func MyFormato () -> String {
        do {
            let valor: Int = try Int(self)!
            guard valor <= 9 else { return self }
            return String(format: "%02d", valor)
        } catch {
            return self
        }
    }
    
    /// Convierte el String con el formato '0|0|0|0' en una lista de Int.
    ///
    /// - Parameter separador: Caracter usado para separar los numeros (Defauld: |).
    /// - Returns: [Int].
    public func descomponer(separador: String = "|") -> [Int] { //converALibros
        return self.components(separatedBy: separador).map { Int($0)! }
    }
    
    /// Convierte en Date el String.
    ///
    /// - Returns: Date.
    public func getFecha() -> Date {
        let fechaInt = self.descomponer(separador: "|")
        return Date().getFecha(fechaInt[1], mes: fechaInt[0])
    }
    
}
