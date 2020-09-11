//
//  TableViewCell.swift
//  NicknameGeneratorU
//
//  Created by Batuhan Karababa on 11.09.2020.
//  Copyright © 2020 Batuhan Karababa. All rights reserved.
//

import UIKit

class FavoriteCell: UITableViewCell {
    
    lazy var lblNickName:UILabel = {
        let lbl = NGLabel()
        lbl.adjustsFontSizeToFitWidth = true
        lbl.font = UIFont.systemFont(ofSize: 35,weight: .bold)
        return lbl
    }()
    
    lazy var lblcreationDate:UILabel = {
        let lbl = NGLabel()
        return lbl
    }()
    
    lazy var favoriteButton:UIButton = {
        let btn = NGButton()
        btn.setTitle("Remove", for: .normal)
        btn.addTarget(self, action: #selector(removeClicked), for: .touchUpInside)
        return btn
    }()
    
    var gelenFavori:FavoriteNicknames!
    
    var delegate:RemoveFavoriteDelegate?
    
    var index:IndexPath!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        adjustConstraints()
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func adjustConstraints(){
        lblNickName.heightAnchor.constraint(equalToConstant: 50).isActive = true
        lblcreationDate.heightAnchor.constraint(equalToConstant: 20).isActive = true
        let stackView = UIStackView(arrangedSubviews: [lblNickName,lblcreationDate])
        addSubview(stackView)
        addSubview(favoriteButton)
        stackView.axis = .vertical
        stackView.spacing = 3
        _ = stackView.heightAnchor.constraint(equalToConstant: 70)
        _ = stackView.anchor(top: safeAreaLayoutGuide.topAnchor, bottom: safeAreaLayoutGuide.bottomAnchor, leading: safeAreaLayoutGuide.leadingAnchor, trailing: nil,padding: .init(top: 6, left: 6, bottom: 6, right: 0))
        _ = favoriteButton.anchor(top: stackView.topAnchor, bottom: stackView.bottomAnchor, leading: stackView.trailingAnchor, trailing: safeAreaLayoutGuide.trailingAnchor,padding: .init(top: 3, left: 0, bottom: 3, right: 10),boyut: .init(width: 80, height: 0))
    }
    
    func adjustView(favori:FavoriteNicknames,delegate:RemoveFavoriteDelegate,index:IndexPath){
        lblNickName.text = favori.nickname
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd || hh:mm:ss"
        if let date = favori.creationDate{
            lblcreationDate.text = formatter.string(from: date)
        }
        self.delegate = delegate
        gelenFavori = favori
        self.index = index
        backgroundColor = UIColor.hexStringToUIColor(hex: "#b661ae")
    }
    
    @objc func removeClicked(){
        delegate?.removeClicked(favori: gelenFavori,index: index)
    }
    
}

protocol RemoveFavoriteDelegate{
    func removeClicked(favori:FavoriteNicknames,index:IndexPath)
}
