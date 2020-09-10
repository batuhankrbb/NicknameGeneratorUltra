//
//  NGLabel.swift
//  NicknameGeneratorU
//
//  Created by Batuhan Karababa on 10.09.2020.
//  Copyright © 2020 Batuhan Karababa. All rights reserved.
//

import Foundation
import UIKit

class NGLabel:UILabel{
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        font = UIFont.init(name: Fonts.fontLabel, size: 20)
        textColor = .black
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
