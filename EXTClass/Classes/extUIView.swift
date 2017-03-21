//
//  extUIView.swift
//  Pods
//
//  Created by Matías Correnti on 19/3/17.
//
//

import UIKit

extension UIView {

    public func shakeViewForTimes(_ times: Int) {
        let anim = CAKeyframeAnimation(keyPath: "transform")
        anim.values = [
            NSValue(caTransform3D: CATransform3DMakeTranslation(-5, 0, 0 )),
            NSValue(caTransform3D: CATransform3DMakeTranslation( 5, 0, 0 ))
        ]
        anim.autoreverses = true
        anim.repeatCount = Float(times)
        anim.duration = 7/100

        self.layer.add(anim, forKey: nil)
    }

    public func shakeHorizontal(_ repeticiones: Int, withDelta: CGFloat, duracion: Double) {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = duracion
        animation.repeatCount = Float(repeticiones)
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - withDelta, y: self.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: self.center.x + withDelta, y: self.center.y))
        self.layer.add(animation, forKey: "position")
    }

    /// Remueve todos los subviews.
    public func removeSubviews() {
        for subview in subviews {
            subview.removeFromSuperview()
        }
    }

    public func animate(duration: TimeInterval, animations: @escaping (() -> Void), completion: ((Bool) -> Void)? = nil) {
        UIView.animate(withDuration: duration, animations: animations, completion: completion)
    }

    public func hasSuperview(_ superview: UIView) -> Bool{
        return viewHasSuperview(self, superview: superview)
    }

    public func viewHasSuperview(_ view: UIView, superview: UIView) -> Bool {
        if let sview = view.superview {
            if sview === superview {
                return true
            }else{
                return viewHasSuperview(sview, superview: superview)
            }
        }else{
            return false
        }
    }

}
