//
//  StringGenerator.swift
//  NicknameGenerator
//
//  Created by Batuhan Karababa on 9.09.2020.
//  Copyright © 2020 Batuhan Karababa. All rights reserved.
//

import Foundation

class StringGenerator{

    
    let numbers = "123456789"
    let lowerCases = "abcdefghijklmnopqrstuvwxyz"
    
    var beginWith:String?
    var endWith:String?
    var withoutString:String?
    var isNumberEnabled:Bool?
    var length:Int?
    
    init(beginWith:String?, endWith:String?, withoutString:String?, isNumberEnabled:Bool?,length:Int?) {
        self.beginWith = beginWith ?? ""
        self.endWith = endWith ?? ""
        self.withoutString = withoutString ?? ""
        self.isNumberEnabled = isNumberEnabled ?? false
        self.length = length
    }

    
    func generateString() -> String{
        var fullStringForGenerate = lowerCases
        
        if isNumberEnabled ?? false{
            fullStringForGenerate.append(numbers)
        }
        
        var nickName = String((0...(self.length ?? Int.random(in: 3...5))).map{_ in
            (fullStringForGenerate.randomElement()!)
            }).replacingOccurrences(of: withoutString ?? "", with: "")
        
        if let begin = beginWith{
            nickName = begin + nickName
        }
        if let end = endWith{
            nickName = nickName + end
        }
        return nickName.capitalizingFirstLetter()
    }
    
    func resetSettings(){
        self.beginWith = ""
        self.endWith = ""
        self.withoutString = ""
        self.isNumberEnabled = false
        self.length = nil
    }
    

    
}


