import XCTest
@testable import KCSwiftUI

final class GetCharactersUseCaseTests: XCTestCase {
    var sut: GetCharactersUseCaseProtocol!
    var mockCharactersRepository: MockCharactersRepository!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        mockCharactersRepository = MockCharactersRepository()
        sut = GetCharactersUseCase(charactersRepository: mockCharactersRepository)
    }
    
    override func tearDownWithError() throws {
        mockCharactersRepository = nil
        sut = nil
        try super.tearDownWithError()
    }
    
    func testGetCharacters_ShouldSucceed() async throws {
        // Given
        mockCharactersRepository.receivedCharacters = DomainData.givenCharacterList
        
        // When
        let characters = try await sut.run()
        
        // Then
        XCTAssertNotNil(characters)
        XCTAssertEqual(characters.count, 5)
        let firstResult = try XCTUnwrap(characters.first)
        XCTAssertEqual(firstResult.id, 1009150)
        XCTAssertEqual(firstResult.name, "Agent Zero")
        XCTAssertEqual(firstResult.thumbnail, "http://i.annihil.us/u/prod/marvel/i/mg/f/60/4c0042121d790.jpg")
    }
    
    func testGetCharacters_WhenResponseIsEmpty_ShouldReturnError() async throws {
        // Given
        mockCharactersRepository.receivedCharacters = []
        
        // When
        var presentationError: PresentationError?
        do {
            let _ = try await sut.run()
        } catch let error as PresentationError {
            presentationError = error
        }
        
        // Then
        XCTAssertNotNil(presentationError)
        XCTAssertEqual(presentationError, .emptyList())
    }
}
