//
//  FavoriteNicknames+CoreDataProperties.swift
//  NicknameGeneratorU
//
//  Created by Batuhan Karababa on 11.09.2020.
//  Copyright © 2020 Batuhan Karababa. All rights reserved.
//
//

import Foundation
import CoreData


extension FavoriteNicknames {

    @nonobjc public class func createFetchRequest() -> NSFetchRequest<FavoriteNicknames> {
        return NSFetchRequest<FavoriteNicknames>(entityName: "FavoriteNicknames")
    }

    @NSManaged public var nickname: String?
    @NSManaged public var creationDate: Date?

}
