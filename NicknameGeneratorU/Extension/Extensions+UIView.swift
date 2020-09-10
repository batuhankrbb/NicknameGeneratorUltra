//
//  Extensions+UIView.swift
//  NicknameGenerator
//
//  Created by Batuhan Karababa on 9.09.2020.
//  Copyright © 2020 Batuhan Karababa. All rights reserved.
//

import Foundation
import UIKit

struct AnchorConstraints {
    var top : NSLayoutConstraint?
    var bottom : NSLayoutConstraint?
    var trailing : NSLayoutConstraint?
    var leading : NSLayoutConstraint?
    var width : NSLayoutConstraint?
    var height : NSLayoutConstraint?
}



extension UIView {
    
    func anchor(top : NSLayoutYAxisAnchor?,
                bottom : NSLayoutYAxisAnchor?,
                leading : NSLayoutXAxisAnchor?,
                trailing : NSLayoutXAxisAnchor?,
                padding : UIEdgeInsets = .zero,
                boyut : CGSize = .zero) -> AnchorConstraints {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        
        var aConstraint = AnchorConstraints()
        
        if let top = top {
            aConstraint.top = topAnchor.constraint(equalTo: top, constant: padding.top)
        }
        
        if let bottom = bottom {
            aConstraint.bottom = bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom)
        }
        if let leading = leading {
            aConstraint.leading = leadingAnchor.constraint(equalTo: leading, constant: padding.left)
        }
        
        if let trailing = trailing {
            aConstraint.trailing = trailingAnchor.constraint(equalTo: trailing, constant: -padding.right)
        }
        
        if boyut.width != 0 {
            aConstraint.width = widthAnchor.constraint(equalToConstant: boyut.width)
        }
        
        if boyut.height != 0 {
            aConstraint.height = heightAnchor.constraint(equalToConstant: boyut.height)
        }
        
        [aConstraint.top,aConstraint.bottom,aConstraint.trailing,aConstraint.leading,aConstraint.height,aConstraint.width].forEach { $0?.isActive = true }
        
        
        return aConstraint
        
    }
    
    func doldurSuperView(padding : UIEdgeInsets = .zero) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let sTop = superview?.topAnchor {
            topAnchor.constraint(equalTo: sTop, constant: padding.top).isActive = true
        }
        
        if let sBottom = superview?.bottomAnchor {
            bottomAnchor.constraint(equalTo: sBottom, constant: -padding.bottom).isActive = true
        }
        
        if let sLeading = superview?.leadingAnchor {
            leadingAnchor.constraint(equalTo: sLeading, constant: padding.left).isActive = true
        }
        
        if let sTrailing = superview?.trailingAnchor {
            trailingAnchor.constraint(equalTo: sTrailing, constant: -padding.right).isActive = true
        }
    }
    
    func merkezKonumlandirSuperView(boyut : CGSize = .zero) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let merkezX = superview?.centerXAnchor {
            centerXAnchor.constraint(equalTo: merkezX).isActive = true
        }
        if let merkezY = superview?.centerYAnchor {
            centerYAnchor.constraint(equalTo: merkezY).isActive = true
        }
        
        if boyut.height != 0 {
            heightAnchor.constraint(equalToConstant: boyut.height).isActive = true
        }
        if boyut.width != 0 {
            widthAnchor.constraint(equalToConstant: boyut.width).isActive = true
        }
        
    }
    
    
    
}
