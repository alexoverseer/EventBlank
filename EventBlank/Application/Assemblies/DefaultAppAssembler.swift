import Swinject

class DefaultAppAssembler: AppAssembler {
    
    private let container: Container
    private let assembler: Assembler
    
    private (set) static var shared = DefaultAppAssembler()
    
    private init() {
        container = Container()
        assembler = Assembler(container: container)
    }
    
    func assembly() {
        let viewModelAssembly = ViewModelAssembly()
        let factoryAssembly = FactoryAssembly()
        let networkServicesAssembly = NetworkAssembly()
        
        assembler.apply(assemblies: [viewModelAssembly, factoryAssembly, networkServicesAssembly])
    }
    
    var resolver: Resolver {
        
        return container
    }
}
