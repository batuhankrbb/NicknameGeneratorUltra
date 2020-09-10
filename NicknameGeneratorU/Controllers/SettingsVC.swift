//
//  SettingsVC.swift
//  NicknameGeneratorU
//
//  Created by Batuhan Karababa on 10.09.2020.
//  Copyright © 2020 Batuhan Karababa. All rights reserved.
//

import UIKit

class SettingsVC: UIViewController {

    let settingsView = SettingsView()
    var delegate:SettingsViewDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        adjustView()
        settingsView.delegate = self.delegate
        self.navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(title: "OK", style: .done, target: self, action: #selector(doneButton))
        
    }
    
    fileprivate func adjustView(){
         view.backgroundColor = UIColor.hexStringToUIColor(hex: "#ece8e8")
         view.addSubview(settingsView)
         settingsView.textFieldBegin.widthAnchor.constraint(equalTo: settingsView.textFieldEnd.widthAnchor).isActive = true
        _ = settingsView.anchor(top: view.safeAreaLayoutGuide.topAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, trailing: view.safeAreaLayoutGuide.trailingAnchor,padding: .init(top: 50, left: 50, bottom: 50, right: 50))
    }
    
    @objc fileprivate func doneButton(){
        self.dismiss(animated: true, completion: nil)
    }
    
}



