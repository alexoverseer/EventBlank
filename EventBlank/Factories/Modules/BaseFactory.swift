import Foundation
import Swinject

class BaseFactory {
    
    internal let resolver: Resolver
    
    init(resolver: Resolver) {
        self.resolver = resolver
    }
}
