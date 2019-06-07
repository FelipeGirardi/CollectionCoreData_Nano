//
//  RoundedView.swift
//  CheckersApp
//
//  Created by Thiago Nitschke Simões on 02/04/19.
//  Copyright © 2019 Thiago Nitschke Simões. All rights reserved.
//

import UIKit


@IBDesignable public class CustomButton: UIButton {

    @IBInspectable var borderColor: UIColor = UIColor.white {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }

    @IBInspectable var borderWidth: CGFloat = 0.0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }

    @IBInspectable var cornerRadius: CGFloat = 10.0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
        
    @IBInspectable var shadowColor: CGColor = UIColor.gray.cgColor {
        didSet {
            layer.shadowColor = shadowColor
        }
    }

    @IBInspectable var shadowOffset: CGSize = CGSize(width: 1, height: 1) {
        didSet {
            layer.shadowOffset = shadowOffset
        }
    }

    @IBInspectable var shadowOpacity: Float = 0.9 {
        didSet {
            layer.shadowOpacity = shadowOpacity
        }
    }

    @IBInspectable var shadowRadius: CGFloat = 5.0 {
        didSet {
            layer.shadowRadius = shadowRadius
        }
    }
}

//extension CALayer {
//    func applySketchShadow(
//        color: UIColor = .black,
//        alpha: Float = 0.5,
//        x: CGFloat = 0,
//        y: CGFloat = 2,
//        blur: CGFloat = 4,
//        spread: CGFloat = 0)
//    {
//        shadowColor = color.cgColor
//        shadowOpacity = alpha
//        shadowOffset = CGSize(width: x, height: y)
//        shadowRadius = blur / 2.0
//        if spread == 0 {
//            shadowPath = nil
//        } else {
//            let dx = -spread
//            let rect = bounds.insetBy(dx: dx, dy: dx)
//            shadowPath = UIBezierPath(rect: rect).cgPath
//        }
//    }
//}
