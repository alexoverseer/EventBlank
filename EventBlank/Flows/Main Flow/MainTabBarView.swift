import UIKit

protocol MainTabBarView: class {

    var onFeedFlowSelect: ((UINavigationController) -> Void)? { get set }
    var onAboutFlowSelect: ((UINavigationController) -> Void)? { get set }
    var onFavouritesFlowSelect: ((UINavigationController) -> Void)? { get set }
    
    var onViewDidLoad: ((UINavigationController) -> Void)? { get set }
    func startFlow()
}
