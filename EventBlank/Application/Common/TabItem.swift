import UIKit

enum TabItem: Int, CaseIterable {
    
    case schedule
    case feed
    case speakers
    
    var title: String {
        switch self {
        case .schedule:
            return NSLocalizedString("tab.schedule", comment: "")
        case .feed:
            return NSLocalizedString("tab.feed", comment: "")
        case .speakers:
            return NSLocalizedString("tab.speakers", comment: "")
        }
    }
    
    var imageName: String {
        switch self {
        case .schedule:
            return "tab.schedule"
        case .feed:
            return "tab.feed"
        case .speakers:
            return "tab.speakers"
        }
    }
    
    var image: UIImage? {
        return UIImage.init(named: self.imageName)
    }
    
    static func current(rawValue: Int) -> TabItem {
        return TabItem(rawValue: rawValue) ?? .schedule
    }
}
