import UIKit
import MapKit

class AppInfoViewController: UIViewController, AppInfoView {
    
    @IBOutlet private weak var mapView: MKMapView!
    
    var viewModel: AppInfoViewModel!
    var onOpenMapImage: ((UIImage?, UIView) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.onViewDidLoad(self)
        setupUI()
    }
    
    private func setupUI() {
        navigationItem.title = "About"
    }
    
    @IBAction private func togleCameraView(_ sender: UIButton) {
        viewModel.openEventLocation()
    }
}

extension AppInfoViewController: AppInfoViewModelOutput {
    
    func showRegion(_ region: MKCoordinateRegion, with annotation: MKPointAnnotation) {
        mapView.setRegion(region, animated: true)
        mapView.addAnnotation(annotation)
    }
}
