//
//  NGFavoriteStackView.swift
//  NicknameGeneratorU
//
//  Created by Batuhan Karababa on 10.09.2020.
//  Copyright © 2020 Batuhan Karababa. All rights reserved.
//

import Foundation
import UIKit

class NGFavoriteStackView:UIStackView{
    
    var isFavorite = false // bu özelliği gözleyeceğiz
    let starButton = UIImageView(image: UIImage(systemName: "star"))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        axis = .horizontal
        let label = NGLabel()
        label.text = "Add To Favorite"
        starButton.isUserInteractionEnabled = true
        starButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        starButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        starButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(favoriteTapped)))
        addArrangedSubview(label)
        addArrangedSubview(starButton)
        spacing = 10
        
        
    }
    
    @objc fileprivate func favoriteTapped(){
        if isFavorite{
              self.starButton.image = UIImage(systemName: "star.fill")
        }else{
            self.starButton.image = UIImage(systemName: "star")
        }
        isFavorite = !isFavorite
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
