//
//  SettingsViewBelow.swift
//  NicknameGenerator
//
//  Created by Batuhan Karababa on 9.09.2020.
//  Copyright © 2020 Batuhan Karababa. All rights reserved.
//

import Foundation
import UIKit

class SettingsViewBelow: UIStackView {
    
    lazy var lengthSlider:UISlider = {
        let slider = UISlider()
        slider.maximumValue = 20
        slider.minimumValue = 2
        slider.value = 2
        slider.minimumTrackTintColor = UIColor.mainColor()
        return slider
    }()

    lazy var lengthLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.init(name: Fonts.franchise, size: 20)
        label.textColor = .black
        label.text = "Random"
        label.textAlignment = .center
        return label
    }()
    
    lazy var resetButton:UIButton = {
        let buton = UIButton()
        buton.setTitle("Reset Settings", for: .normal)
        buton.layer.cornerRadius = 15
        buton.backgroundColor = UIColor.mainColor()
        buton.titleLabel?.textColor = .white
        buton.titleLabel?.font = UIFont.init(name: Fonts.franchise, size: 20)
        return buton
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
       addArrangedSubview(lengthSlider)
        addArrangedSubview(lengthLabel)
        addArrangedSubview(resetButton)
        distribution = .equalCentering
        axis = .vertical
        spacing = 20
        isLayoutMarginsRelativeArrangement = true
        layoutMargins = .init(top: 30, left: 0, bottom: 0, right: 0)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
