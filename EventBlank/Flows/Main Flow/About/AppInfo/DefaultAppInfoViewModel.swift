import Foundation
import MapKit

final class DefaultAppInfoViewModel: AppInfoViewModel {
    
    var output: AppInfoViewModelOutput?
    
    func onViewDidLoad(_ view: AppInfoView) {
        buildLocation()
    }
    
    func buildLocation() {
        let (region, annotation) = EventRegionBuilder.buildEventLocation()
        output?.showRegion(region, with: annotation)
    }
    
    func openEventLocation() {
        let (mapItem, options) = EventRegionBuilder.buildMapItem()
        mapItem.openInMaps(launchOptions: options)
    }
}
