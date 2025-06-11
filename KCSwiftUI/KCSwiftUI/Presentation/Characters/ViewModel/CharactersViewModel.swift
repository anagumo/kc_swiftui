import Foundation
import Combine

enum CharactersViewState {
    case none, loading, loaded, empty
}

@Observable final class CharactersViewModel {
    var charactersViewState: CharactersViewState
    var characters: [Character]
    private var getCharactersUseCase: GetCharactersUseCaseProtocol
    
    init(getCharactersUseCase: GetCharactersUseCaseProtocol) {
        charactersViewState = .none
        characters = []
        self.getCharactersUseCase = getCharactersUseCase
    }
    
    func load() {
        charactersViewState = .loading
        
        Task {
            do {
                let characters = try await getCharactersUseCase.run()
                self.characters = characters
                charactersViewState = .loaded
            } catch let error as PresentationError {
                charactersViewState = .empty
            }
        }
    }
}
