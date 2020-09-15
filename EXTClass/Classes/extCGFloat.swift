//
//  extCGFloat.swift
//  Pods
//
//  Created by Matías Correnti on 19/3/17.
//
//

import UIKit

extension CGFloat {

    /// Return the central value of CGFloat.
    public var center: CGFloat { return (self / 2) }

    public func degreesToRadians() -> CGFloat {
        return toRadians()
    }

    public func toRadians() -> CGFloat {
        return (CGFloat.pi * self) / 180.0
    }

    public mutating func toRadiansInPlace() {
        self = (CGFloat.pi * self) / 180.0
    }

    /// Converts angle degrees to radians.
    public func degreesToRadians (_ angle: CGFloat) -> CGFloat {
        return (CGFloat.pi * angle) / 180.0
    }

    /// Convierte a una cadena de texto personalizada describiendo si es kilometros o metros. Muestras: A "2.345 km", "A 278 m", "A 24 m".
    ///
    /// - Parameters:
    ///   - minuscula: Si se quiere la letra "A" en mayúscula o en minúscula.
    ///   - letraInicial: Si se quiere o no la letra "A".
    /// - Returns: Cadena personalizada.
    public func aDistancia(minuscula: Bool, letraInicial: Bool) -> String {
        let ter = self < 1 ? " m" : " km"
        var num: String = ""
        if self < 0.01 {
            num = String(format: "%.3f", self)
            
//            let dd = String(num[..<num.startIndex])
            
//            let ddd = num.substring(range: <#T##NSRange#>)
            
            num = num.substring(from: num.index(num.startIndex, offsetBy: 4))
        } else if self < 0.1 {
            num = String(format: "%.3f", self)
            num = num.substring(from: num.index(num.startIndex, offsetBy: 3))
        } else if self < 1 {
            num = String(format: "%.3f", self)
            num = num.substring(from: num.index(num.startIndex, offsetBy: 2))
        } else {
            num = String(format: "%.3f", self)
        }
        var letra = "A "
        if minuscula {
            letra = "a "
        }
        if !letraInicial {
            letra = ""
        }
        let tex = letra + num + ter
        return tex
    }

    /// Le aplica una ganancia al número.
    ///
    /// - Parameter ganancia: Ganancia a aplicar (Ej: 30 para un 30%).
    /// - Returns: El valor original más la ganancia aplicada.
    public func getGanancia(_ ganancia: CGFloat) -> CGFloat {
        let gana = self * (ganancia/100)
        return self + gana
    }

}
