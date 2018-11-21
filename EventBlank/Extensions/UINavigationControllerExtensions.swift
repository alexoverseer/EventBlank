import UIKit

extension UINavigationController {
    
    func enableLargeTitles() {
        if #available(iOS 11.0, *) {
            navigationBar.prefersLargeTitles = true
            navigationItem.largeTitleDisplayMode = .automatic
        }
    }
    
    func disableLargeTitles() {
        if #available(iOS 11.0, *) {
            navigationBar.prefersLargeTitles = false
            navigationItem.largeTitleDisplayMode = .never
        }
    }
    
    func setTitleAttributesColor(_ color: UIColor = UIColor.white) {
        
        let lightAttributes = [NSAttributedString.Key.foregroundColor: color]
        
        if #available(iOS 11.0, *) {
            navigationBar.largeTitleTextAttributes = lightAttributes
        } else {
            navigationBar.titleTextAttributes = lightAttributes
        }
    }
}
