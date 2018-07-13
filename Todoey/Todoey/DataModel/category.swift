//
//  category.swift
//  Todoey
//
//  Created by Prasul Surendran on 09/07/18.
//  Copyright © 2018 Prasul Surendran. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name: String = ""
    //now to establish relation parameter in realm we use the following code
    let items = List<Item>()
}
