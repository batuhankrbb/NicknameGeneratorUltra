//
//  NGSwitch.swift
//  NicknameGeneratorU
//
//  Created by Batuhan Karababa on 10.09.2020.
//  Copyright © 2020 Batuhan Karababa. All rights reserved.
//

import Foundation
import  UIKit

class NGSwitch:UISwitch{
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        onTintColor = UIColor.mainColor()
        isOn = false
        tintColor = .lightGray      
        addTarget(self, action: #selector(animForSwitch), for: .valueChanged)
    }
    
    @objc func animForSwitch(){
        UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
            if self.isOn{
                self.transform = CGAffineTransform(scaleX: 1.15, y: 1.15)
            }
        }) { (isFinished) in
            if isFinished{
                self.transform = .identity
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
