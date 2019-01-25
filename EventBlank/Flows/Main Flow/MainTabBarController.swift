import UIKit
import ESTabBarController_swift

class MainTabBarController: ESTabBarController, MainTabBarView {
    
    var onFeedFlowSelect: ((UINavigationController) -> Void)?
    var onAboutFlowSelect: ((UINavigationController) -> Void)?
    var onFavouritesFlowSelect: ((UINavigationController) -> Void)?
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
        case .feed:
            onFeedFlowSelect?(controller)
        case .about:
            onAboutFlowSelect?(controller)
        case .favourites:
            onFavouritesFlowSelect?(controller)
        }
    }
}
