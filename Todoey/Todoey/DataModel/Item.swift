//
//  items.swift
//  Todoey
//
//  Created by Prasul Surendran on 09/07/18.
//  Copyright © 2018 Prasul Surendran. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object{
    @objc dynamic var itemName: String = ""
    @objc dynamic var itemDone: Bool = false
    @objc dynamic var dateCreated: Date?
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
}
