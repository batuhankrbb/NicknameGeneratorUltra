//
//  NGTextField.swift
//  NicknameGeneratorU
//
//  Created by Batuhan Karababa on 9.09.2020.
//  Copyright © 2020 Batuhan Karababa. All rights reserved.
//

import Foundation
import UIKit

class NGTextField:UITextField{
    
    let padding = UIEdgeInsets.init(top: 0, left: 10, bottom: 0, right: 10)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .white
        textColor = .black
        layer.cornerRadius = 10
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
      return bounds.inset(by: padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
      return bounds.inset(by: padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
      return bounds.inset(by: padding)
    }
    
    
    
}
