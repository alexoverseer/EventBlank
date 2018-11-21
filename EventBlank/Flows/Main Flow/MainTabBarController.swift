import UIKit
import ESTabBarController_swift

class MainTabBarController: ESTabBarController, MainTabBarView {
    
    var onScheduleFlowSelect: ((UINavigationController) -> Void)?
    var onFeedFlowSelect: ((UINavigationController) -> Void)?
    var onSpeakersFlowSelect: ((UINavigationController) -> Void)?
    var onViewDidLoad: ((UINavigationController) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        delegate = self
    }
    
    func startFlow() {
        if let controller = customizableViewControllers?.first as? UINavigationController {
            onViewDidLoad?(controller)
            self.selectedIndex = 0
        }
    }
}

extension MainTabBarController: UITabBarControllerDelegate {
    
    typealias SelectedFlow = TabItem
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        
        guard let controller = viewControllers?[selectedIndex] as? UINavigationController else { return }
        let selectedFlow = SelectedFlow.current(rawValue: selectedIndex)
        
        switch selectedFlow {
        case .schedule:
            onScheduleFlowSelect?(controller)
        case .feed:
            onFeedFlowSelect?(controller)
        case .speakers:
            onSpeakersFlowSelect?(controller)
        }
    }
}
