//
//  SettingsView.swift
//  NicknameGenerator
//
//  Created by Batuhan Karababa on 9.09.2020.
//  Copyright © 2020 Batuhan Karababa. All rights reserved.
//

import Foundation
import UIKit

class SettingsViewUp:UIStackView{
    
     var textFieldBegin:UITextField = {
        let textField = OzelTextField()
        return textField
    }()
    
     var textFieldEnd:UITextField = {
        let textField = OzelTextField()
        return textField
    }()
    
     var textFieldWithout:UITextField = {
        let textField = OzelTextField()
        return textField
    }()
    
    var numbersSwitch:UISwitch{
        let mySw = UISwitch()
        mySw.onTintColor = UIColor.mainColor()
        mySw.isOn = false
        mySw.tintColor = .lightGray
        return mySw
    }
    
    var uppercaseSwitch:UISwitch{
        let mySw = UISwitch()
        mySw.onTintColor = UIColor.mainColor()
        mySw.isOn = false
        mySw.tintColor = .lightGray
        return mySw
    }
    
    let settingsViewBelow = SettingsViewBelow()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let beginSV = OzelStackView(item: createLbl(text: "Begin With:"), item2: textFieldBegin)
        let endSV = OzelStackView(item: createLbl(text: "End With:"), item2: textFieldEnd)
        let unwantedSV = OzelStackView(item: createLbl(text: "Unwanted Text:"), item2: textFieldWithout)
        let numberSV = OzelStackView(item: createLbl(text: "Numbers:"), item2: numbersSwitch)
        let uppercaseSV = OzelStackView(item: createLbl(text: "Uppercase:"), item2: uppercaseSwitch)
        
        [beginSV,endSV,unwantedSV,numberSV,uppercaseSV,settingsViewBelow].forEach{addArrangedSubview($0)}
        distribution = .equalCentering
        axis = .vertical
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func createLbl(text:String) -> UILabel{
        let label = UILabel()
        label.font = UIFont.init(name: Fonts.franchise, size: 20)
        label.textColor = .black
        label.text = text
        label.heightAnchor.constraint(equalToConstant: 25).isActive = true
        return label
    }
        
}
