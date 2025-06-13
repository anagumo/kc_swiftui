import XCTest
@testable import KCSwiftUI

final class CharactersViewModelTests: XCTestCase {
    var sut: CharactersViewModel!
    var mockGetCharactersUseCase: MockGetCharactersUseCase!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        mockGetCharactersUseCase = MockGetCharactersUseCase()
        sut = CharactersViewModel(getCharactersUseCase: mockGetCharactersUseCase)
    }
    
    override func tearDownWithError() throws {
        sut = nil
        mockGetCharactersUseCase = nil
        try super.tearDownWithError()
    }
    
    func testLoadcharacters_WhenStateIsLoaded() async throws {
        // Given
        mockGetCharactersUseCase.receivedCharacters = DomainData.givenCharacterList
        
        // When
        sut.load()
        try await Task.sleep(for: .seconds(0.1))
        
        // Then
        XCTAssertEqual(sut.characterViewState, .loaded)
        XCTAssert(!sut.characters.isEmpty)
        let firstResult = try XCTUnwrap(sut.characters.first)
        XCTAssertEqual(firstResult.name, "Agent Zero")
    }
    
    func testLoadcharacters_WhenStateIsEmpty() async throws {
        // Given
        mockGetCharactersUseCase.receivedCharacters = nil
        
        // When
        sut.load()
        try await Task.sleep(for: .seconds(0.1))
        
        // Then
        XCTAssertEqual(sut.characterViewState, .empty)
        XCTAssert(sut.characters.isEmpty)
        XCTAssertNil(sut.characters.first)
    }
}
