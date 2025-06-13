import XCTest
@testable import KCSwiftUI

final class MockGetCharactersUseCase: GetCharactersUseCaseProtocol {
    var receivedCharacters: [KCCharacter]?
    
    func run() async throws -> [KCSwiftUI.KCCharacter] {
        guard let receivedCharacters else {
            throw PresentationError.emptyList()
        }

        return receivedCharacters
    }
}
