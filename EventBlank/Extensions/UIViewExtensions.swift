import UIKit

extension UIView {
    
    func addShadow(radius: CGFloat = 5, offset: CGSize = CGSize(width: 0, height: 5),
                   opacity: Float = 0.2, color: UIColor = .black) {
        
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offset
        layer.shadowRadius = radius
        layer.masksToBounds = false
        clipsToBounds = false
    }
}
