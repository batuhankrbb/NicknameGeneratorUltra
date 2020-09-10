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

  

    var delegate:SettingsViewDelegate?
    
     var textFieldBegin:UITextField = {
        let textField = NGTextField()
        return textField
    }()
    
     var textFieldEnd:UITextField = {
        let textField = NGTextField()
        return textField
    }()
    
     var textFieldWithout:UITextField = {
        let textField = NGTextField()
        return textField
    }()
    
     var numbersSwitch:UISwitch = {
        let mySw = NGSwitch()
        return mySw
    }()
    
     var isRandomSwitch:UISwitch = {
        let mySw = NGSwitch()
        mySw.addTarget(self, action: #selector(isRandomCheck), for: .valueChanged)
        return mySw
    }()
    
     var settingsViewBelow = SettingsViewBelow()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let beginSV = NGStackView(itemlist: [createLbl(text: "Begin With:"),textFieldBegin])
        let endSV = NGStackView(itemlist: [createLbl(text: "End With:"),textFieldEnd])
        let unwantedSV = NGStackView(itemlist: [createLbl(text: "Unwanted Text:"),textFieldWithout])
        let numberSV = NGStackView(itemlist: [createLbl(text: "Numbers:"),numbersSwitch])
        let uppercaseSV = NGStackView(itemlist: [createLbl(text: "Random Length:"),isRandomSwitch])
    
        [beginSV,endSV,unwantedSV,numberSV,uppercaseSV,settingsViewBelow].forEach{addArrangedSubview($0)}
        distribution = .equalCentering
        axis = .vertical
        settingsViewBelow.saveButton.addTarget(self, action: #selector(saveClicked), for: .touchUpInside)
        settingsViewBelow.resetButton.addTarget(self, action: #selector(resetClicked), for: .touchUpInside)
        settingsViewBelow.lengthSlider.addTarget(self, action: #selector(sliderValueChanged), for: .valueChanged)
    }
    
    required init(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
    
    
    @objc fileprivate func isRandomCheck(){
        if isRandomSwitch.isOn{
            settingsViewBelow.lengthLabel.text = "Length: Random"
            settingsViewBelow.lengthSlider.isHidden = true
        }else{
            settingsViewBelow.lengthLabel.text = "Length: \(Int(settingsViewBelow.lengthSlider.value))"
            settingsViewBelow.lengthSlider.isHidden = false
        }
    }
    
    
    @objc fileprivate func sliderValueChanged(){
        settingsViewBelow.lengthLabel.text = "Length: \(Int(settingsViewBelow.lengthSlider.value))"
    }
    
    func adjustView(generator:StringGenerator?){
        textFieldBegin.text = generator?.beginWith ?? ""
        textFieldEnd.text = generator?.endWith ?? ""
        textFieldWithout.text = generator?.withoutString ?? ""
        numbersSwitch.setOn(generator?.isNumberEnabled ?? false, animated: true)
        isRandomSwitch.setOn(generator?.isRandom ?? true, animated: true)
        settingsViewBelow.lengthLabel.text = "Length: Random"
        settingsViewBelow.lengthSlider.value = Float(generator?.length ?? 15)
        isRandomCheck()
    }

    @objc func saveClicked(){
        let generator = StringGenerator(beginWith: textFieldBegin.text, endWith: textFieldEnd.text, withoutString: textFieldWithout.text, isNumberEnabled: numbersSwitch.isOn, length: Int(settingsViewBelow.lengthSlider.value),isRandom: isRandomSwitch.isOn)
        
        delegate?.getTheSettings(generator: generator)
    }
    
    @objc func resetClicked(){
        delegate?.resetSettings()
    }
    
    fileprivate func createLbl(text:String) -> UILabel{
        let label = NGLabel()
        label.text = text
        label.heightAnchor.constraint(equalToConstant: 25).isActive = true
        return label
    }
}


protocol SettingsViewDelegate {
    func getTheSettings(generator: StringGenerator)
    func resetSettings()
}
