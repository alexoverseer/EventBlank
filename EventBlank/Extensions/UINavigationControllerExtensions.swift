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
    
    func setLightTitleAttributes() {
        
        let lightAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        if #available(iOS 11.0, *) {
            navigationBar.largeTitleTextAttributes = lightAttributes
        } else {
            navigationBar.titleTextAttributes = lightAttributes
        }
    }
}
