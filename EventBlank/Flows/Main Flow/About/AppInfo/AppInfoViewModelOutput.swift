import Foundation
import MapKit

public protocol AppInfoViewModelOutput {
    func showRegion(_ region: MKCoordinateRegion, with annotation: MKPointAnnotation)
}
