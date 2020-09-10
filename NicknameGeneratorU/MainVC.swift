//
//  ViewController.swift
//  NicknameGeneratorU
//
//  Created by Batuhan Karababa on 9.09.2020.
//  Copyright © 2020 Batuhan Karababa. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    var mainView = MainView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        view.addSubview(mainView.stackViewGenerateFavorite)
         view.addSubview(mainView.stackViewLabelCopy)
        view.addSubview(mainView.stackViewFavoriteSettings)
        
        mainView.stackViewFavoriteSettings.anchor(top: nil, bottom: view.safeAreaLayoutGuide.bottomAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor,padding: .init(top: 0, left: 50, bottom: 130, right: 50))
        
        mainView.stackViewGenerateFavorite.anchor(top: nil, bottom: mainView.stackViewFavoriteSettings.topAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor,padding: .init(top: 0, left: 50, bottom: 50, right: 50))
        
        mainView.stackViewLabelCopy.anchor(top: view.topAnchor, bottom: mainView.stackViewGenerateFavorite.topAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor,padding: .init(top: 100, left: 20, bottom: 70, right: 20))
        
    }

}

