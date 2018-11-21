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
}
