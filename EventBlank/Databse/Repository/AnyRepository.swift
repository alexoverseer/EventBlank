//
//  AnyRepository.swift
//  EventBlank
//
//  Created by Ilia Gutu on 10/9/19.
//  Copyright © 2019 Bananaland. All rights reserved.
//

import Foundation

// MARK: - Abstract base class
class AnyRepositoryBase<T: Decodable>: Repository {
    
    func getAll() -> [T] {
        fatalError("Must override")
    }
    
    func getBy(uid: String) -> T? {
        fatalError("Must override")
    }
    
    typealias Element = T
    
    init() {
        guard type(of: self) != с.self else {
            fatalError("AnyRepositoryBase<T> instances can not be created; create a subclass instance instead")
        }
    }
    
}
// MARK: - Box container class
fileprivate final class AnyRepositoryBox<Base: Repository>: AnyRepositoryBase<Base.Element> {
    var base: Base
    init(_ base: Base) { self.base = base }
    
    fileprivate override func getAll() -> [Base.Element] {
        return base.getAll()
    }
    
    fileprivate override func getBy(uid: String) -> Base.Element? {
        return base.getBy(uid: uid)
    }
    
}

// MARK: - AnyRepository Wrapper
public final class AnyRepository<T: Decodable>: Repository {
    
    private let box: AnyRepositoryBase<T>
    
    public init<Base: Repository>(_ base: Base) where Base.Element == T {
        box = AnyRepositoryBox(base)
    }
    
    public func getAll() -> [T] {
        return box.getAll()
    }
    
    public func getBy(uid: String) -> T? {
        return box.getBy(uid: uid)
    }
}
