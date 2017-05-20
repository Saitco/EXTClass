//
//  extNSDate.swift
//  Pods
//
//  Created by Matías Correnti on 19/5/17.
//
//

import UIKit

extension NSDate {
    
    /// Optiene el año en curso.
    ///
    /// - Returns: Int.
    public func getAño() -> Int {
        let calendar =  Calendar.current
        let res = calendar.component(.year, from: self as Date)
        return res
    }
    
    public func getAño(_ valor: Int) -> Bool {
        let calendar =  Calendar.current
        let res = calendar.component(.year, from: self as Date)
        if res == valor { return true } else { return false }
    }
    
    /// Optiene el mes en curso.
    ///
    /// - Returns: Int.
    public func getMes() -> Int {
        let calendar =  Calendar.current
        let res = calendar.component(.month, from: self as Date)
        return res
    }
    
    public func getMes(_ valor: Int) -> Bool {
        let calendar =  Calendar.current
        let res = calendar.component(.month, from: self as Date)
        if res == valor { return true } else { return false }
    }
    
    /// Optiene el dia en curso.
    ///
    /// - Returns: Int.
    public func getDia() -> Int {
        let calendar =  Calendar.current
        let res = calendar.component(.day, from: self as Date)
        return res
    }
    
}
