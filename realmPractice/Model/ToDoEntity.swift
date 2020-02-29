//
//  ToDoEntity.swift
//  realmPractice
//
//  Created by 矢守叡 on 2020/02/29.
//  Copyright © 2020 yamolean. All rights reserved.
//

import Foundation
import RealmSwift

final class ToDoEntity: Object {
    @objc dynamic var Text: String? = nil
}
