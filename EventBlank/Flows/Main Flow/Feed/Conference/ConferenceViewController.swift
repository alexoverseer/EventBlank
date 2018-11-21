import UIKit
import SKPhotoBrowser

class ConferenceViewController: UIViewController, ConferenceView {
    
    var viewModel: ConferenceViewModel!
    
    var onShowTopic: (() -> Void)?
    var onShowSpeaker: (() -> Void)?

    @IBOutlet weak var photosCollectionView: UICollectionView!
    @IBOutlet weak var conferenceTableView: UITableView!
    @IBOutlet weak var pageIndicator: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        viewModel.onViewDidLoad(self)
    }
    
    private func setupUI() {
        #warning ("Replace with conference name!")
        navigationItem.title = "NSSpain [2018]"
        viewModel.registerCollection(photosCollectionView)
        viewModel.registerTable(conferenceTableView)
        
        photosCollectionView.register(cellType: PhotoCollectionViewCell.self)
        conferenceTableView.register(cellType: TopicTableViewCell.self)
        conferenceTableView.register(cellType: SpeakerTableViewCell.self)
    }
}

extension ConferenceViewController: ConferenceViewModelOutput {
    
    func setTotalPhotosPagesNumber(pages: Int) {
        pageIndicator.numberOfPages = pages
    }
    
    func setCurrentPage(page: Int) {
        pageIndicator.currentPage = page
    }
    
    func openPhotoBrowser(originImage: UIImage?, cell: UICollectionViewCell) {
        #warning ("Map orignal images")
        var images = [SKPhoto]()
        let photo = SKPhoto.photoWithImage(#imageLiteral(resourceName: "blank.conference.jpg"))
        images.append(photo)
        images.append(photo)
        images.append(photo)
        
        let browser = SKPhotoBrowser(originImage: originImage ?? UIImage(), photos: images, animatedFromView: cell)
        
        browser.initializePageIndex(pageIndicator.currentPage)
        present(browser, animated: true, completion: {})
    }
}
