import Foundation

final class DefaultFavouritesModuleFactory: BaseFactory, FavouritesModuleFactory {
    
    func makeFavouritesListOutput() -> FavouritesListView {
        let viewModel = resolver.resolve(FavouritesListViewModel.self)!
        let controller = FavouritesListViewController()
        controller.viewModel = viewModel
        viewModel.output = controller
        
        return controller
    }
}
