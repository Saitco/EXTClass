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
