import Foundation
import Swinject

protocol AppAssembler {
    func assembly()
    var resolver: Resolver { get }
}
