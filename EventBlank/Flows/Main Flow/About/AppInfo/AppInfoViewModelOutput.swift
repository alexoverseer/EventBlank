import Foundation
import MapKit

protocol AppInfoViewModelOutput {
    func showRegion(_ region: MKCoordinateRegion, with annotation: MKPointAnnotation)
}
