//
//  NGStackView.swift
//  NicknameGeneratorU
//
//  Created by Batuhan Karababa on 10.09.2020.
//  Copyright © 2020 Batuhan Karababa. All rights reserved.
//

import Foundation
import UIKit

class NGStackView:UIStackView{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(itemlist:[UIView]) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        itemlist.forEach{item in
            addArrangedSubview(item)
        }
        spacing = 20
        axis = .horizontal
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
