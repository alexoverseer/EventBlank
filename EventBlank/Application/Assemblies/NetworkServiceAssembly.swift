import Swinject

class NetworkAssembly: Assembly {
    
    func assemble(container: Container) {

        container.register(VimeoVideoExtractor.self) { _ in
            return DefaultVimeoVideoExtractor()
        }
    }
}
