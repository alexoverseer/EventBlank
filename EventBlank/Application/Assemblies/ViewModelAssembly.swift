import Foundation
import Swinject

class ViewModelAssembly: Assembly {
    
    func assemble(container: Container) {
        
        container.register(ScheduleListViewModel.self) { _ in
            return DefaultScheduleListViewModel()
        }
    }
}
