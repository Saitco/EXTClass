//
//  extString.swift
//  Pods
//
//  Created by Matías Correnti on 18/3/17.
//
//

import UIKit

extension String {
    
    func rangesOfString(_ s: String, textoExacto: Bool) -> [Range<Index>] {
        if textoExacto {
            let re = try! NSRegularExpression(pattern: NSRegularExpression.escapedPattern(for: s), options: [])
            return re.matches(in: self, options: [], range: nsRange(from: startIndex ..< endIndex)).flatMap { range(from: $0.range) }
        } else {
            let re = try! NSRegularExpression(pattern: NSRegularExpression.escapedPattern(for: s), options: [.caseInsensitive])
            return re.matches(in: self, options: [], range: nsRange(from: startIndex ..< endIndex)).flatMap { range(from: $0.range) }
        }
    }
    
    //Para Swift3
    func range(from nsRange: NSRange) -> Range<String.Index>? {
        guard
            let from16 = utf16.index(utf16.startIndex, offsetBy: nsRange.location, limitedBy: utf16.endIndex),
            let to16 = utf16.index(from16, offsetBy: nsRange.length, limitedBy: utf16.endIndex),
            let from = String.Index(from16, within: self),
            let to = String.Index(to16, within: self)
            else { return nil }
        return from ..< to
    }
    
    //Para Swift3
    func nsRange(from range: Range<String.Index>) -> NSRange {
        let utf16view = self.utf16
        let from = range.lowerBound.samePosition(in: utf16view)
        let to = range.upperBound.samePosition(in: utf16view)
        return NSMakeRange(utf16view.distance(from: utf16view.startIndex, to: from),
                           utf16view.distance(from: from, to: to))
    }
    
}
