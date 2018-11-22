import UIKit

class ConferenceViewController: UIViewController, ConferenceView {

    var viewModel: ConferenceViewModel!
    
    var onShowTopic: (() -> Void)?
    var onShowSpeaker: (() -> Void)?
    var onShowPhotoBrowser: ((PhotoBrowserModel) -> Void)?

    @IBOutlet weak var photosCollectionView: UICollectionView!
    @IBOutlet weak var conferenceTableView: UITableView!
    @IBOutlet weak var pageIndicator: UIPageControl!
    @IBOutlet weak var tableHeightConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        viewModel.onViewDidLoad(self)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        updateTableHeight()
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
    
    @IBAction func didChangeType(_ sender: UISegmentedControl) {
        let selectedConferenceType = SelectedConferenceType.current(rawValue: sender.selectedSegmentIndex)
        viewModel.changeTableType(selectedType: selectedConferenceType)
    }
}

extension ConferenceViewController: ConferenceViewModelOutput {
    
    func setTotalPhotosPagesNumber(pages: Int) {
        pageIndicator.numberOfPages = pages
    }
    
    func setCurrentPage(page: Int) {
        pageIndicator.currentPage = page
    }
    
    func updateTableHeight() {
        tableHeightConstraint.constant = conferenceTableView.contentSize.height
        self.view.layoutIfNeeded()
    }
    
    func openPhotoBrowser(originImage: UIImage?, images: [UIImage], cell: UICollectionViewCell) {
        let model = PhotoBrowserModel(originImage: originImage,
                                      images: images,
                                      sourceView: cell,
                                      index: pageIndicator.currentPage)
        onShowPhotoBrowser?(model)
    }
    
    func openTopic() {
        onShowTopic?()
    }
    
    func openSpeaker() {
        onShowSpeaker?()
    }
}
