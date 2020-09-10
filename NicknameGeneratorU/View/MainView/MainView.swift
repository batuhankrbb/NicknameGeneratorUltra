//
//  MainView.swift
//  NicknameGeneratorU
//
//  Created by Batuhan Karababa on 10.09.2020.
//  Copyright © 2020 Batuhan Karababa. All rights reserved.
//

import Foundation
import UIKit



class MainView:UIStackView{
    
    lazy var buttonFavorites:UIButton = {
        let buton = NGButton()
        buton.setTitle("Favorites", for: .normal)
        buton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        return buton
    }()
    
    lazy var buttonSettings:UIButton = {
        let buton = NGButton()
        buton.setTitle("Settings", for: .normal)
        buton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        return buton
    }()
    
    
    lazy var buttonAddToFavorite:UIStackView = {
        let stackview = NGFavoriteStackView()
        stackview.heightAnchor.constraint(equalToConstant: 35).isActive = true
        return stackview
    }()
    
    lazy var buttonGenerate:UIButton = {
        let buton = NGButton()
        buton.setTitle("Generate Username", for: .normal)
        buton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        return buton
    }()
    
    
    lazy var labelNickName:UILabel = {
           let label = NGLabel()
        label.font = UIFont.systemFont(ofSize: 70,weight: .medium)
        label.heightAnchor.constraint(equalToConstant: 100).isActive = true
        label.adjustsFontSizeToFitWidth = true
        label.text = "DenemeNickname"
        label.textAlignment = .center
           return label
       }()
    
    lazy var buttonCopy:UIButton = {
        let buton = NGButton()
        buton.setTitle("Copy", for: .normal)
        buton.heightAnchor.constraint(equalToConstant: 35).isActive = true
        return buton
    }()
    
    
    lazy var stackViewLabelCopy = NGStackViewForMain(arrangedSubviews: [buttonCopy,labelNickName])
    
    lazy var stackViewFavoriteSettings = NGStackViewForMain(arrangedSubviews: [buttonFavorites,buttonSettings])
    
    lazy var stackViewGenerateFavorite = NGStackViewForMain(arrangedSubviews: [buttonGenerate,buttonAddToFavorite])
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        stackViewFavoriteSettings.heightAnchor.constraint(equalToConstant: 100).isActive = true
        stackViewGenerateFavorite.heightAnchor.constraint(equalToConstant: 110).isActive = true
        stackViewLabelCopy.heightAnchor.constraint(equalToConstant: 240).isActive = true
        stackViewLabelCopy.spacing = 15
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class NGStackViewForMain:UIStackView{
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        axis = .vertical
        spacing = 10
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
