//
//  ViewController.swift
//  NicknameGeneratorU
//
//  Created by Batuhan Karababa on 9.09.2020.
//  Copyright © 2020 Batuhan Karababa. All rights reserved.
//

import UIKit
import GoogleMobileAds

class MainVC: UIViewController {
    
    var interstitial: GADInterstitial!
    
    var mainView = MainView()
    var generator = StringGenerator(beginWith: nil, endWith: nil, withoutString: nil, isNumberEnabled: nil, length: nil,isRandom: nil)
    var dataManager = CoreDataService.DAO
    
    fileprivate let settingsVC = SettingsVC()
    fileprivate lazy var settingsNavigation = UINavigationController(rootViewController: settingsVC)
    
    fileprivate let favoriteVC = FavoritesVC()
    fileprivate lazy var favoriteNavigation = UINavigationController(rootViewController: favoriteVC)
    
    var adView:GADBannerView = {
        let gad = GADBannerView(adSize: kGADAdSizeBanner)
        gad.translatesAutoresizingMaskIntoConstraints = false
        gad.adUnitID = "ca-app-pub-6513980326757872/4298423849"
        return gad
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        adjustIntersititialAdView()
        adjustConstraints()
        addTargets()
        addFavoriteObserver()
        generateNickName()
    }
    
    
    fileprivate func adjustConstraints(){
        view.backgroundColor = .white
        view.addSubview(mainView.stackViewGenerateFavorite)
        view.addSubview(mainView.stackViewLabelCopy)
        view.addSubview(mainView.stackViewFavoriteSettings)
        _ = mainView.stackViewFavoriteSettings.anchor(top: nil, bottom: view.safeAreaLayoutGuide.bottomAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor,padding: .init(top: 0, left: 50, bottom: 130, right: 50))
        _ = mainView.stackViewGenerateFavorite.anchor(top: nil, bottom: mainView.stackViewFavoriteSettings.topAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor,padding: .init(top: 0, left: 50, bottom: 50, right: 50))
        _ = mainView.stackViewLabelCopy.anchor(top: view.topAnchor, bottom: mainView.stackViewGenerateFavorite.topAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor,padding: .init(top: 100, left: 20, bottom: 65, right: 20))
        adjustAdView()
    }
    
    fileprivate func adjustAdView(){
        view.addSubview(adView)
        adView.rootViewController = self
        adView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        adView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        adView.load(GADRequest())
    }
    
    
    fileprivate func addTargets(){
        mainView.buttonGenerate.addTarget(self, action: #selector(generateNickName), for: .touchUpInside)
        mainView.buttonCopy.addTarget(self, action: #selector(copyLabel), for: .touchUpInside)
        mainView.buttonSettings.addTarget(self, action: #selector(goToSetting), for: .touchUpInside)
        mainView.buttonFavorites.addTarget(self, action: #selector(goToFavorites), for: .touchUpInside)
    }
}

extension MainVC{
    @objc fileprivate func generateNickName(){
        mainView.labelNickName.text = generator.generateString()
        mainView.buttonAddToFavorite.resetFavorite()
    }
    
    @objc fileprivate func copyLabel(){
        UIPasteboard.general.string = mainView.labelNickName.text
    }
    
    @objc fileprivate func goToSetting(){
        if interstitial.isReady {
            interstitial.present(fromRootViewController: self)
        }else{
            settingsVC.delegate = self
            settingsNavigation.modalPresentationStyle = .automatic
            settingsVC.generatorForView = generator
            present(settingsNavigation, animated: true, completion: nil)
        }
    }
    
    @objc fileprivate func goToFavorites(){
        favoriteNavigation.modalPresentationStyle = .fullScreen
        dataManager.getSortedData { (nicknameList) in
            self.favoriteVC.favoriler = nicknameList
            self.present(self.favoriteNavigation, animated: true, completion: nil)
        }
        
    }
    
    fileprivate func addFavoriteObserver(){
        mainView.buttonAddToFavorite.isFavoriteObserver = { isFavorite in
            let labelNick = self.mainView.labelNickName.text!
            let nicknames =  self.dataManager.checkNicknameExist(nickname: labelNick)
            if nicknames.count <= 0{
                let newFavorite = FavoriteNicknames(context: self.dataManager.viewContext)
                newFavorite.creationDate = Date()
                newFavorite.nickname = labelNick
            }else{
                self.dataManager.viewContext.delete(nicknames[0])
            }
            self.dataManager.saveContext()
        }
    }
}

extension MainVC:GADInterstitialDelegate{
    
    fileprivate func adjustIntersititialAdView(){
        interstitial = createAndLoadInterstitial()
    }
    
    fileprivate func createAndLoadInterstitial() -> GADInterstitial {
        var interstitial = GADInterstitial(adUnitID: "ca-app-pub-6513980326757872/1652272725")
        interstitial.delegate = self
        interstitial.load(GADRequest())
        return interstitial
    }
    
    func interstitialDidDismissScreen(_ ad: GADInterstitial) {
        interstitial = createAndLoadInterstitial()
        settingsVC.delegate = self
        settingsNavigation.modalPresentationStyle = .automatic
        settingsVC.generatorForView = generator
        present(settingsNavigation, animated: true, completion: nil)
    }
}


extension MainVC:SettingsViewDelegate{
    func getTheSettings(generator: StringGenerator) {
        self.generator = generator
        self.settingsNavigation.dismiss(animated: true, completion: nil)
    }
    
    func resetSettings() {
        self.generator.resetSettings()
        self.settingsNavigation.dismiss(animated: true, completion: nil)
    }
}


