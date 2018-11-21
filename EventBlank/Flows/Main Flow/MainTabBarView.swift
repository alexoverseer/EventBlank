import UIKit

protocol MainTabBarView: class {
    
    var onScheduleFlowSelect: ((UINavigationController) -> Void)? { get set }
    var onFeedFlowSelect: ((UINavigationController) -> Void)? { get set }
    var onSpeakersFlowSelect: ((UINavigationController) -> Void)? { get set }
    var onViewDidLoad: ((UINavigationController) -> Void)? { get set }
    func startFlow()
}
