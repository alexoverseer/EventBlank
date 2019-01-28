//
//  Result.swift
//  EventBlank
//
//  Created by Alexandr Pavlov on 1/28/19.
//  Copyright © 2019 Bananaland. All rights reserved.
//

import Foundation

enum Result<Value, Error: Swift.Error> {
    case success(Value)
    case failure(Error)
}
