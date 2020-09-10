//
//  NGButton.swift
//  NicknameGeneratorU
//
//  Created by Batuhan Karababa on 9.09.2020.
//  Copyright © 2020 Batuhan Karababa. All rights reserved.
//

import Foundation
import UIKit

class NGButton:UIButton{
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 15
        addTarget(self, action: #selector(clickedUp), for: .touchDown)
        addTarget(self, action: #selector(clickedDown), for: .touchUpInside)
        titleLabel?.font = UIFont(name: Fonts.franchise, size: 20)
        backgroundColor = UIColor.mainColor()
        titleLabel?.textColor = .white
        
    }
    
    @objc fileprivate func clickedDown(){
        UIView.animate(withDuration: 15 / 100, delay: 0, usingSpringWithDamping: 05, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
            self.transform = .identity
            
        })
    }
    
    @objc fileprivate func clickedUp(){
        UIView.animate(withDuration: 15 / 100, delay: 0, usingSpringWithDamping: 05, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
            self.transform = CGAffineTransform(scaleX: 0.90, y: 0.90)
        })
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
