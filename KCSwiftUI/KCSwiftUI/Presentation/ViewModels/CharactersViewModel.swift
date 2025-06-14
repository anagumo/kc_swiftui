import Foundation
import Combine

enum CharacterViewState {
    case none, loading, loaded, empty
}

@Observable final class CharactersViewModel {
    private let getCharactersUseCase: GetCharactersUseCaseProtocol
    var characterViewState: CharacterViewState
    var characters: [CharcterModel]
    
    init(getCharactersUseCase: GetCharactersUseCaseProtocol = GetCharactersUseCase()) {
        characters = []
        characterViewState = .none
        self.getCharactersUseCase = getCharactersUseCase
    }
    
    func load() {
        characterViewState = .loading
        
        Task { @MainActor in
            do {
                let characters = try await getCharactersUseCase.run()
                self.characters = characters
                characterViewState = .loaded
            } catch _ as PresentationError {
                characterViewState = .empty
            }
        }
    }
}
