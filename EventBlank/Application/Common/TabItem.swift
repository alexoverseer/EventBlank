import UIKit

enum TabItem: Int, CaseIterable {
    
    case feed
    case about
    case favourites
    
    var title: String {
        switch self {
        case .feed:
            return NSLocalizedString("tab.feed", comment: "")
        case .about:
            return NSLocalizedString("tab.about", comment: "")
        case .favourites:
            return NSLocalizedString("tab.favourites", comment: "")
        }
    }
    
    var imageName: String {
        switch self {
        case .feed:
            return "tab.feed"
        case .about:
            return "tab.about"
        case .favourites:
            return "tab.favourites"
        }
    }
    
    var image: UIImage? {
        return UIImage.init(named: self.imageName)
    }
    
    static func current(rawValue: Int) -> TabItem {
        return TabItem(rawValue: rawValue) ?? .feed
    }
}
