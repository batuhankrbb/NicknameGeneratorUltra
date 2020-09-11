//
//  CoreDataService.swift
//  NicknameGeneratorU
//
//  Created by Batuhan Karababa on 11.09.2020.
//  Copyright © 2020 Batuhan Karababa. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class CoreDataService{
    
    private init(){}
    static let DAO = CoreDataService()
    
    let viewContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func saveContext(){
        if viewContext.hasChanges{
            do{
                try viewContext.save()
            }catch{
                debugPrint("Error occured in saveContext")
            }
        }
    }
    
    func getSortedData(compHandler handler: @escaping (([FavoriteNicknames]) -> Void) ){
       let request = FavoriteNicknames.createFetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: coreDataVars.creationDate.rawValue, ascending: false)]
        do{
            let data =  try viewContext.fetch(request)
            handler(data)
            return
        }catch{
            debugPrint("Error occured in getSortedData")
        }
        handler([])
    }
    
    func checkNicknameExist(nickname:String) -> [FavoriteNicknames]{
        let request = FavoriteNicknames.createFetchRequest()
        request.predicate = NSPredicate(format: "\(coreDataVars.nickname) == %@","\(nickname)")
        do{
            let data =  try viewContext.fetch(request)
            return data
        }catch{
            debugPrint("Error occured in checkNicknameExist")
            return []
        }
    }
}


enum coreDataVars:String{
    case creationDate = "creationDate"
    case nickname = "nickname"
}
