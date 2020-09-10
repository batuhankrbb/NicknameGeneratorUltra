//
//  SettingsViewDown.swift
//  NicknameGeneratorU
//
//  Created by Batuhan Karababa on 10.09.2020.
//  Copyright © 2020 Batuhan Karababa. All rights reserved.
//

import Foundation
import UIKit

 class SettingsViewBelow: UIStackView {
    
    lazy var lengthSlider:UISlider = {
        let slider = UISlider()
        slider.maximumValue = 15
        slider.minimumValue = 3
        slider.setValue(15, animated: true)
        slider.minimumTrackTintColor = UIColor.mainColor()
        return slider
    }()
    
    lazy var lengthLabel:UILabel = {
        let label = NGLabel()
        label.text = "Length: Random"
        label.textAlignment = .center
        return label
    }()
    
    
    lazy var saveButton:UIButton = {
        let buton = NGButton()
        buton.setTitle("Save Settings", for: .normal)
        buton.titleLabel?.textColor = .white
        return buton
    }()
    
    lazy var resetButton:UIButton = {
        let buton = NGButton()
        buton.setTitle("Reset Settings", for: .normal)
        buton.titleLabel?.textColor = .white
        return buton
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addArrangedSubview(lengthSlider)
        addArrangedSubview(lengthLabel)
        addArrangedSubview(saveButton)
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
