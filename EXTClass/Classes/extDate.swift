//
//  extDate.swift
//  Pods
//
//  Created by Matías Correnti on 18/3/17.
//
//

import UIKit

extension Date {

    /// Lo convierte a String.
    ///
    /// - Parameters:
    ///   - format: Formato a usar (Default: dd/MM/yyyy, HH:mm:ss)
    /// - Returns: String.
    public func toString(format: String = "dd/MM/yyyy, HH:mm:ss") -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }

    /// Optiene el año en curso.
    ///
    /// - Returns: Int.
    public func getAño() -> Int {
        let calendar =  Calendar.current
        let res = calendar.component(.year, from: self)
        return res
    }

    /// Optiene el mes en curso.
    ///
    /// - Returns: Int.
    public func getMes() -> Int {
        let calendar =  Calendar.current
        let res = calendar.component(.month, from: self)
        return res
    }

    /// Optiene el dia en curso.
    ///
    /// - Returns: Int.
    public func getDia() -> Int {
        let calendar =  Calendar.current
        let res = calendar.component(.day, from: self)
        return res
    }

    /// Crea una fecha en base a un día y mes con el año en curso.
    ///
    /// - Parameters:
    ///   - dia: Número del día.
    ///   - mes: Número del mes.
    /// - Returns: Date.
    public func getFecha(_ dia: Int, mes: Int) -> Date {
        let calendar =  Calendar.current
        let year =  calendar.component(.year, from: self)

        let format: String = "dd/MM/yyyy"
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.date(from: "\(dia)/\(mes)/\(year)")!
    }

    /// Compara la fecha con otra fecha para saber si son iguales (No tiene en cuenta la hora).
    ///
    /// - Parameter comparar: Fecha para comparar.
    /// - Returns: true o false
    func compararFechas(comparar: Date) -> Bool {
        let calendar =  Calendar.current
        let fechaSelf: Date = self
        let year1: Int = calendar.component(.year, from: fechaSelf)
        let month1: Int = calendar.component(.month, from: fechaSelf)
        let day1: Int = calendar.component(.day, from: fechaSelf)

        let calendar2 = Calendar.current
        let year2: Int = calendar2.component(.year, from: comparar)
        let month2: Int = calendar2.component(.month, from: comparar)
        let day2: Int = calendar2.component(.day, from: comparar)

        if day1 == day2 && month1 == month2 && year1 == year2 {
            return true
        } else {
            return false
        }
    }

}





// MARK: - Para ver el tiempo pasado.
extension Date {

    /// Unidades de tiempo disponibles.
    public enum unidadTiempo {
        case segundos
        case minutos
        case horas
        case dias
        case semanas
        case meses
        case años
    }

    /// Pregunta si ya pasó el tiempo.
    ///
    /// - Parameters:
    ///   - tiempo: Tiempo que debe pasar.
    ///   - unidad: Unidad de tiempo a ver.
    /// - Returns: True = Pasó el tiempo, False: No pasó el tiempo.
    public func pasoElTiempo(tiempo: Int, unidad: unidadTiempo) -> Bool {
        let seconds = abs(Date().timeIntervalSince1970 - self.timeIntervalSince1970)
        let minutes = Int(floor(seconds / 60))
        let hours = minutes / 60
        let days = hours / 24
        let weeks = days / 7
        let months = weeks / 4
        let years = months / 12

        switch unidad {
        case .segundos:
            if Int(seconds) > tiempo { return true }
        case .minutos:
            if minutes > tiempo { return true }
        case .horas:
            if hours > tiempo { return true }
        case .dias:
            if days > tiempo { return true }
        case .semanas:
            if weeks > tiempo { return true }
        case .meses:
            if months > tiempo { return true }
        case .años:
            if years > tiempo { return true }
        }
        return false
    }

}





// MARK: - Complemento social.
extension Date {

    /// <#Description#>
    ///
    /// - Returns: <#return value description#>
    func sinceIngles() -> String {
        let seconds = abs(Date().timeIntervalSince1970 - self.timeIntervalSince1970)
        if seconds <= 120 {
            return "just now"
        }
        let minutes = Int(floor(seconds / 60))
        if minutes <= 60 {
            return "\(minutes) mins ago"
        }
        let hours = minutes / 60
        if hours <= 24 {
            return "\(hours) hrs ago"
        }
        if hours <= 48 {
            return "yesterday"
        }
        let days = hours / 24
        if days <= 30 {
            return "\(days) days ago"
        }
        if days <= 14 {
            return "last week"
        }
        let months = days / 30
        if months == 1 {
            return "last month"
        }
        if months <= 12 {
            return "\(months) months ago"
        }
        let years = months / 12
        if years == 1 {
            return "last year"
        }
        return "\(years) years ago"
    }

    /// Social.
    ///
    /// - Returns: <#return value description#>
    func sinceCastellano() -> String {
        let seconds = abs(Date().timeIntervalSince1970 - self.timeIntervalSince1970)
        if seconds <= 120 {
            return "ahora"
        }
        let minutes = Int(floor(seconds / 60))
        if minutes <= 60 {
            return "hace \(minutes) minutos"
        }
        let hours = minutes / 60
        if hours <= 24 {
            return "hace \(hours) horas"
        }
        if hours <= 48 {
            return "ayer"
        }
        let days = hours / 24
        if days <= 30 {
            return "hace \(days) días"
        }
        if days <= 14 {
            return "semana pasada"
        }
        let months = days / 30
        if months == 1 {
            return "mes pasado"
        }
        if months <= 12 {
            return "hace \(months) meses"
        }
        let years = months / 12
        if years == 1 {
            return "año pasado"
        }
        return "hace \(years) años"
    }

}
