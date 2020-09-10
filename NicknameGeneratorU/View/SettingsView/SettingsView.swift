//
//  SettingsView.swift
//  NicknameGeneratorU
//
//  Created by Batuhan Karababa on 10.09.2020.
//  Copyright © 2020 Batuhan Karababa. All rights reserved.
//

import Foundation
import UIKit

class SettingsView:UIStackView{
    lazy var textFieldBegin:UITextField = {
        let textField = NGTextField()
        return textField
    }()
    
    lazy var textFieldEnd:UITextField = {
        let textField = NGTextField()
        return textField
    }()
    
    lazy var textFieldWithout:UITextField = {
        let textField = NGTextField()
        return textField
    }()
    
    lazy var numbersSwitch:UISwitch = {
        let mySw = NGSwitch()
        return mySw
    }()
    
    lazy var uppercaseSwitch:UISwitch = {
        let mySw = NGSwitch()
        return mySw
    }()
    
    lazy var settingsViewBelow = SettingsViewBelow()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let beginSV = NGStackView(itemlist: [createLbl(text: "Begin With:"),textFieldBegin])
        let endSV = NGStackView(itemlist: [createLbl(text: "End With:"),textFieldEnd])
        let unwantedSV = NGStackView(itemlist: [createLbl(text: "Unwanted Text:"),textFieldWithout])
        let numberSV = NGStackView(itemlist: [createLbl(text: "Numbers:"),numbersSwitch])
        let uppercaseSV = NGStackView(itemlist: [createLbl(text: "Uppercase:"),uppercaseSwitch])
        [beginSV,endSV,unwantedSV,numberSV,uppercaseSV,settingsViewBelow].forEach{addArrangedSubview($0)}
        distribution = .equalCentering
        axis = .vertical
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    fileprivate func createLbl(text:String) -> UILabel{
        let label = NGLabel()
        label.text = text
        label.heightAnchor.constraint(equalToConstant: 25).isActive = true
        return label
    }
}


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
