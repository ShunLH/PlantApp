//
//  RoundCornerView.swift
//  PlantApp
//
//  Created by Thuriya ACE Technology on 11/15/19.
//  Copyright © 2019 TAT. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable

class RoundCornerView : UIView {
    @IBInspectable var cornerRadius : CGFloat = 2
    @IBInspectable var shadowOffsetWidth : Int = 0
    @IBInspectable var shadowOffsetHeight : Int = 3
    @IBInspectable var shadowColor : UIColor? = UIColor.black
    @IBInspectable var shadowOpacity : Float = 0.5
    @IBInspectable var leftCorner : Bool = true
    @IBInspectable var rightCorner : Bool = false

    override func layoutSubviews() {
        var corners : UIRectCorner = [UIRectCorner.topLeft,UIRectCorner.bottomLeft,UIRectCorner.topRight,UIRectCorner.bottomRight]
        if !leftCorner {
            corners = [UIRectCorner.topRight,UIRectCorner.bottomRight]
        }
        if !rightCorner {
            corners  = [UIRectCorner.topLeft,UIRectCorner.bottomLeft]
        }
        
        
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
        layer.masksToBounds = true

//        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
//        layer.masksToBounds = false
//        layer.shadowColor = shadowColor?.cgColor
//        layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight)
//        layer.shadowOpacity = shadowOpacity
//        layer.shadowPath = shadowPath.cgPath
    }
}
