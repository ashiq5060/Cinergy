//
//  CornerRadious.swift
//  Cinergy
//
//  Created by Ashiq P Paulose on 14/01/24.
//

import UIKit

@IBDesignable
class CornerRoundedView: UIView {
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
}

@IBDesignable
class CornerRoundedImageView: UIImageView {
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
}

@IBDesignable
class CornerRoundedButton: UIButton {
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }

    @IBInspectable var makeRoundButton: Bool = false {
        didSet {
            if makeRoundButton {
                layer.cornerRadius = bounds.height / 2
                layer.masksToBounds = true
            }
        }
    }
}
