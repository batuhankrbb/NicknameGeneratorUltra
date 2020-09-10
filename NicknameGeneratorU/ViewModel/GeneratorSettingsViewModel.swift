//
//  SettingsViewModel.swift
//  NicknameGeneratorU
//
//  Created by Batuhan Karababa on 9.09.2020.
//  Copyright © 2020 Batuhan Karababa. All rights reserved.
//

import Foundation

class GeneratorSettingsViewModel{
    var beginWith:String
    var endWith:String
    var withoutString:String
    var isNumberEnabled:Bool
    var length:Int
    
    init(beginWith:String, endWith:String, withoutString:String, isNumberEnabled:Bool,length:Int) {
        self.beginWith = beginWith
        self.endWith = endWith
        self.withoutString = withoutString
        self.isNumberEnabled = isNumberEnabled
        self.length = length
    }
    
    
    
}
