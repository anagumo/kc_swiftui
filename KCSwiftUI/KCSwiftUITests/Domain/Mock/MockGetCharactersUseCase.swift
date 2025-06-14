import XCTest
@testable import KCSwiftUI

final class MockGetCharactersUseCase: GetCharactersUseCaseProtocol {
    var receivedCharacters: [CharacterModel]?
    
    func run() async throws -> [KCSwiftUI.CharacterModel] {
        guard let receivedCharacters else {
            throw PresentationError.emptyList()
        }

        return receivedCharacters
    }
}
