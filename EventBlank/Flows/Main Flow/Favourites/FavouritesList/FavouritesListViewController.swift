import UIKit

class FavouritesListViewController: UIViewController, FavouritesListView {

    var viewModel: FavouritesListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.onViewDidLoad(self)
        setupUI()
    }

    private func setupUI() {
        navigationItem.title = "Favourites"
    }
}

extension FavouritesListViewController: FavouritesListViewModelOutput {
    
}
