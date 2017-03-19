//
//  extFloat.swift
//  Pods
//
//  Created by Matías Correnti on 19/3/17.
//
//

import UIKit

extension Float {
    
    /// Le aplica una ganancia al número.
    ///
    /// - Parameter ganancia: Ganancia a aplicar (Ej: 30 para un 30%).
    /// - Returns: El valor original más la ganancia aplicada.
    public func getGanancia(_ ganancia: Float) -> Float {
        let gana = self * (ganancia/100)
        return self + gana
    }
    
    /// Le resta un valor y regresa el resultado de esa resta (Puede regresar valores negativos si el valor es mayor al número a operar).
    ///
    /// - Parameter numero: Valor para restar.
    /// - Returns: Resta entre los dos números.
    public func getDifNumero(_ numero: Float) -> Float {
        return self - numero
    }
    
    /// Calcula la diferencia y la regresa en porcentaje (Regresa siempre valor positivo).
    ///
    /// - Parameter numero: Valor para restar.
    /// - Returns: Porcentaje de la resta.
    public func getDifPorciento(_ numero: Float) -> Float {
        var resultado: Float = 0
        let valor = ((self-numero) * (100/numero))
        if valor < 0 {
            resultado = (valor * -1)
        } else {
            resultado = valor
        }
        return resultado
    }
    
    /// Multiplica el número.
    ///
    /// - Parameter valor: Múltiplo.
    /// - Returns: Número multiplicado.
    public func multiplicar(_ valor: Int) -> Float {
        return self * Float(valor)
    }
    
}
