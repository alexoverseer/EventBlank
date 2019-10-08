import Foundation

public final class DefaultFavouritesModuleFactory: BaseFactory, FavouritesModuleFactory {
    
    public func makeFavouritesListOutput() -> FavouritesListView {
        let viewModel = DefaultFavouritesListViewModel()
        let controller = FavouritesListViewController()
        controller.viewModel = viewModel
        viewModel.output = controller
        
        return controller
    }
}
