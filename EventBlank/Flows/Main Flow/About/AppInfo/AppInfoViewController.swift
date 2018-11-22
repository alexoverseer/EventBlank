import UIKit

class AppInfoViewController: UIViewController, AppInfoView {

    var viewModel: AppInfoViewModel!
    var onOpenMapImage: ((UIImage?, UIView) -> Void)?
    
    @IBOutlet weak var mapImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.onViewDidLoad(self)
        setupUI()
    }
    
    private func setupUI() {
        navigationItem.title = "About"
    }
    
    @IBAction func didTapOnImage() {
        onOpenMapImage?(mapImageView.image, mapImageView)
    }
}

extension AppInfoViewController: AppInfoViewModelOutput {
    
}
