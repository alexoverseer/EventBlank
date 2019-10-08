//
//  Repository.swift
//  EventBlank
//
//  Created by Ilia Gutu on 11/21/18.
//  Copyright © 2018 Bananaland. All rights reserved.
//

import Foundation

public protocol Repository {
    associatedtype Element
    func getAll() -> [Element]
    func getBy(uid: String) -> Element?
}
