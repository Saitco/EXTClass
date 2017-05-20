//
//  extInt.swift
//  Pods
//
//  Created by Matías Correnti on 19/3/17.
//
//

import UIKit

extension Int {

    /// Regresa el número con el formato "01".
    ///
    /// - Returns: String.
    public func MyFormato() -> String {
        return String(format: "%02d", self)
    }

    public var toFloat: Float {
        return Float(self)
    }

    public var toCGFloat: CGFloat {
        return CGFloat(self)
    }

    public var toString: String {
        return String(self)
    }

    public func randomIntFrom(start: Int, to end: Int) -> Int {
        var a = start
        var b = end
        // swap to prevent negative integer crashes
        if a > b { swap(&a, &b) }
        return Int(arc4random_uniform(UInt32(b - a + 1))) + a
    }

    public func randomIntFrom(to end: Int) -> Int {
        var a = self
        var b = end
        // swap to prevent negative integer crashes
        if a > b { swap(&a, &b) }
        return Int(arc4random_uniform(UInt32(b - a + 1))) + a
    }
}


extension Int {
    
    /// Regresa el nombre del mes correspondiente (valido entre 1 y 12)
    var toMes: String {
        if 1 == self {
            return "Enero"
        } else if 2 == self {
            return "Febrero"
        } else if 3 == self {
            return "Marzo"
        } else if 4 == self {
            return "Abril"
        } else if 5 == self {
            return "Mayo"
        } else if 6 == self {
            return "Junio"
        } else if 7 == self {
            return "Julio"
        } else if 8 == self {
            return "Agosto"
        } else if 9 == self {
            return "Septiembre"
        } else if 10 == self {
            return "Octubre"
        } else if 11 == self {
            return "Noviembre"
        } else if 12 == self {
            return "Diciembre"
        }
        return ""
    }
    
}
