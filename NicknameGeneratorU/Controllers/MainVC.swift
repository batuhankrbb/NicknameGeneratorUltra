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
    var generator = StringGenerator(beginWith: nil, endWith: nil, withoutString: nil, isNumberEnabled: nil, length: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        adjustConstraints()
        mainView.buttonGenerate.addTarget(self, action: #selector(generateNickName), for: .touchUpInside)
        mainView.buttonCopy.addTarget(self, action: #selector(copyLabel), for: .touchUpInside)
        mainView.buttonSettings.addTarget(self, action: #selector(goToSetting), for: .touchUpInside)
        mainView.buttonFavorites.addTarget(self, action: #selector(goToFavorites), for: .touchUpInside)
        addFavoriteObserver()
   
    }
    
    @objc func generateNickName(){
        mainView.labelNickName.text = generator.generateString()
    }
    
    @objc func copyLabel(){
        UIPasteboard.general.string = mainView.labelNickName.text
    }
    
    @objc func goToSetting(){
       let setVC = SettingsVC()
       let nav = UINavigationController(rootViewController: setVC)
        setVC.delegate = self
       nav.modalPresentationStyle = .automatic
       present(nav, animated: true, completion: nil)
    }
    
    @objc func goToFavorites(){
       
    }
    
     func addFavoriteObserver(){
        mainView.buttonAddToFavorite.isFavoriteObserver = { isFavorite in
            print("ooldu bu  \(isFavorite ? "favori" : "favori değil")")
        }
    }
    
    func adjustConstraints(){
        view.backgroundColor = .white
         view.addSubview(mainView.stackViewGenerateFavorite)
          view.addSubview(mainView.stackViewLabelCopy)
         view.addSubview(mainView.stackViewFavoriteSettings)
        _ = mainView.stackViewFavoriteSettings.anchor(top: nil, bottom: view.safeAreaLayoutGuide.bottomAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor,padding: .init(top: 0, left: 50, bottom: 130, right: 50))
        _ = mainView.stackViewGenerateFavorite.anchor(top: nil, bottom: mainView.stackViewFavoriteSettings.topAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor,padding: .init(top: 0, left: 50, bottom: 50, right: 50))
        _ = mainView.stackViewLabelCopy.anchor(top: view.topAnchor, bottom: mainView.stackViewGenerateFavorite.topAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor,padding: .init(top: 100, left: 20, bottom: 70, right: 20))
    }

}

extension MainVC:SettingsViewDelegate{
    func getTheSettings(generator: StringGenerator) {
        self.generator = generator
    }
    
    func resetSettings() {
        self.generator.resetSettings()
    }
    
    
}

