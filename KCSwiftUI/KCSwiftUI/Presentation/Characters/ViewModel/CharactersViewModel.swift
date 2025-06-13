import Foundation
import Combine

enum CharacterViewState {
    case none, loading, loaded, empty
}

@Observable final class CharactersViewModel {
    private let getCharactersUseCase: GetCharactersUseCaseProtocol
    var characterViewState: CharacterViewState
    var characters: [KCCharacter]
    
    init(getCharactersUseCase: GetCharactersUseCaseProtocol) {
        characterViewState = .none
        print("none")
        characters = []
        self.getCharactersUseCase = getCharactersUseCase
    }
    
    func load() {
        characterViewState = .loading
        print("loading")
        
        Task { @MainActor in
            do {
                let characters = try await getCharactersUseCase.run()
                self.characters = characters
                characterViewState = .loaded
                print("loaded")
            } catch _ as PresentationError {
                characterViewState = .empty
                print("empty")
            }
        }
    }
}
