import XCTest
@testable import KCSwiftUI

final class MockCharactersRepository: CharactersRepositoryProtocol {
    var receivedCharacters: [Character]?
    var receivedSeries: [Serie]?
    
    func getAll() async throws -> [KCSwiftUI.Character] {
        guard let receivedCharacters else {
            throw PresentationError.network("No data received")
        }
        
        guard !receivedCharacters.isEmpty else {
            throw PresentationError.emptyList()
        }
        
        return receivedCharacters
    }
    
    func getSeries(characterIdentifier: Int) async throws -> [KCSwiftUI.Serie] {
        guard let receivedSeries else {
            throw PresentationError.network("No data received")
        }
        
        guard !receivedSeries.isEmpty else {
            throw PresentationError.emptyList()
        }
        
        return receivedSeries
    }
}
