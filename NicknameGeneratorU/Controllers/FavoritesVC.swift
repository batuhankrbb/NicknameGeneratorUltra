//
//  FavoritesVC.swift
//  NicknameGeneratorU
//
//  Created by Batuhan Karababa on 11.09.2020.
//  Copyright © 2020 Batuhan Karababa. All rights reserved.
//

import UIKit

class FavoritesVC: UITableViewController {

    var favoriler = [FavoriteNicknames](){
        didSet{
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.topItem?.leftBarButtonItem = UIBarButtonItem(title: "BACK", style: .done, target: self, action: #selector(goBack))
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoriler.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = FavoriteCell(style: .default, reuseIdentifier: nil)
        cell.adjustView(favori: favoriler[indexPath.row],delegate: self,index:indexPath)
        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    @objc fileprivate func goBack(){
        self.dismiss(animated: true, completion: nil)
    }
}

extension FavoritesVC:RemoveFavoriteDelegate{
    func removeClicked(favori: FavoriteNicknames,index: IndexPath) {
        CoreDataService.DAO.viewContext.delete(favori)
        CoreDataService.DAO.saveContext()
        favoriler.remove(at: index.row)
    }
}
