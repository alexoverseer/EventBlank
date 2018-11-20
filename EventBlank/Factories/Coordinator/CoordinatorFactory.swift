import Foundation
import Swinject

protocol CoordinatorFactory {
 
}

extension CoordinatorFactory {
    
    var resolver: Resolver {
        return DefaultAppAssembler.shared.resolver
    }
}
