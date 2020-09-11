//
//  SettingsVC.swift
//  NicknameGeneratorU
//
//  Created by Batuhan Karababa on 10.09.2020.
//  Copyright © 2020 Batuhan Karababa. All rights reserved.
//

import UIKit
import GoogleMobileAds

class SettingsVC: UIViewController {
    
     
    
    let settingsView = SettingsView()
    var delegate:SettingsViewDelegate?
    var generatorForView:StringGenerator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        adjustView()
        settingsView.delegate = self.delegate
        self.navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(title: "OK", style: .done, target: self, action: #selector(doneButton))
        adjustKeyboard()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        settingsView.adjustView(generator: generatorForView)
    }
    
    fileprivate func adjustView(){
        view.backgroundColor = UIColor.hexStringToUIColor(hex: "#b661ae")
        view.addSubview(settingsView)
        settingsView.textFieldBegin.widthAnchor.constraint(equalTo: settingsView.textFieldEnd.widthAnchor).isActive = true
        _ = settingsView.anchor(top: view.safeAreaLayoutGuide.topAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, trailing: view.safeAreaLayoutGuide.trailingAnchor,padding: .init(top: 50, left: 50, bottom: 50, right: 50))
    }
    
    @objc fileprivate func doneButton(){
        self.dismiss(animated: true, completion: nil)
    }
}



extension SettingsVC{
    
    fileprivate func adjustKeyboard(){
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(closeKeyboard)))
    }
    
    @objc fileprivate func closeKeyboard(){
        view.endEditing(true)
    }
    
    @objc fileprivate func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    
    @objc fileprivate func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
}



