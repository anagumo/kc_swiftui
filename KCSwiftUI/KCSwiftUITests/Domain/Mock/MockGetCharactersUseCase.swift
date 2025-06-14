import XCTest
@testable import KCSwiftUI

final class MockGetCharactersUseCase: GetCharactersUseCaseProtocol {
    var receivedCharacters: [CharcterModel]?
    
    func run() async throws -> [KCSwiftUI.CharcterModel] {
        guard let receivedCharacters else {
            throw PresentationError.emptyList()
        }

        return receivedCharacters
    }
}
