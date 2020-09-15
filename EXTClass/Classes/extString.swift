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
            return re.matches(in: self, options: [], range: nsRange(from: startIndex ..< endIndex)).compactMap { range(from: $0.range) }
        } else {
            let re = try! NSRegularExpression(pattern: NSRegularExpression.escapedPattern(for: s), options: [.caseInsensitive])
            return re.matches(in: self, options: [], range: nsRange(from: startIndex ..< endIndex)).compactMap { range(from: $0.range) }
        }
    }

    //Para Swift4

    /// <#Description#>
    ///
    /// - Parameter range: <#range description#>
    /// - Returns: <#return value description#>
    public func range(from nsRange: NSRange) -> Range<String.Index>? {
        return Range(nsRange, in: self)
    }
    
    //Para Swift4
    
    /// <#Description#>
    ///
    /// - Parameter range: <#range description#>
    /// - Returns: <#return value description#>
    func nsRange(from range: Range<String.Index>) -> NSRange {
        let utf16view = self.utf16
        if let from = range.lowerBound.samePosition(in: utf16view), let to = range.upperBound.samePosition(in: utf16view) {
            return NSMakeRange(utf16view.distance(from: utf16view.startIndex, to: from), utf16view.distance(from: from, to: to))
        }
        return NSMakeRange(0, 0)
    }

    /// Elimina todos los espacios en blanco que se encuentran al final de una cadena.
    ///
    /// - Returns: La cadena sin los espacios al final.
    public func removeLastsEspacios() -> String {
        //TODO: Mejorar
        var returns = self
        var analizar = true
        while analizar {
            if returns.last == " " {
                returns = String(returns[returns.startIndex..<returns.index(before: returns.endIndex)])
            } else {
                analizar = false
            }
        }
        return returns
    }
    
    
    func substring(from: Int, to: Int) -> String {
        let start = index(startIndex, offsetBy: from)
        let end = index(start, offsetBy: to - from)
        return String(self[start ..< end])
    }
    
    func substring(range: NSRange) -> String {
        return substring(from: range.lowerBound, to: range.upperBound)
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
        return self.count
    }

    /// Buscar mediante index.
    ///
    /// - Parameter i: Posición a buscar.
    public subscript (i: Int) -> Character {
        return self[self.index(self.startIndex, offsetBy: i)]
    }

    /// Buscar mediante index.
    ///
    /// - Parameter i: Posición a buscar.
    public subscript (i: Int) -> String {
        return String(self[i] as Character)
    }

    /// Convierte un string a Date, si no puede regresa la fecha del día.
    ///
    /// - Parameter format: Formato de la fecha.
    /// - Returns: Date.
    public func toDate(format: String = "dd/MM/yyyy, HH:mm:ss") -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        if let fechaSalida = formatter.date(from: self) {
            return fechaSalida
        }
        return Date()
    }

    /// Convierte un string a Date, si no puede regresa la fecha del día.
    ///
    /// - Parameter format: Formato de la fecha.
    /// - Returns: Date.
    public func toDateDay() -> Date {
        return self.toDate(format: "dd/MM/yyyy")
    }

    /// Aplica formato personalizado a la cadena (3 a 03).
    ///
    /// - Returns: Cadena modificada.
    public func MyFormato() -> String {
        if let valor = Int(self) {
//            let valor: Int = Int(self)!
            guard valor <= 9 else { return self }
            return String(format: "%02d", valor)
        } else {
            return self
        }
    }
    
    public func toURL() -> URL {
        return URL(string: self)!
    }
    
    public func toInt() -> Int {
        if self == "" { return 0 }
        return Int(self)!
    }
    
    public func toDouble() -> Double {
        if self == "" { return 0.0 }
        return Double(self)!
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
    
    /// Carga un texto usando NSLocalizedString.
    public var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "D")
    }
    
    /// Carga un texto usando NSLocalizedString.
    ///
    /// - Parameter comment: Texto a retornar si no se encuantra el equivalente al texto.
    /// - Returns: String.
    public func localizedWithComment(comment: String) -> String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: comment)
    }

}
