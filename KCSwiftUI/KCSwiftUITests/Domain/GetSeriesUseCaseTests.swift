import XCTest
@testable import KCSwiftUI

final class GetSeriesUseCaseTests: XCTestCase {
    var sut: GetSeriesUseCaseProtocol!
    var mockCharactersRepository: MockCharactersRepository!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        mockCharactersRepository = MockCharactersRepository()
        sut = GetSeriesUseCase(charactersRepository: mockCharactersRepository)
    }
    
    override func tearDownWithError() throws {
        mockCharactersRepository = nil
        sut = nil
        try super.tearDownWithError()
    }
    
    func testGetSeries_ShouldSucceed() async throws {
        // Given
        mockCharactersRepository.receivedSeries = DomainData.givenSerieList
        
        // When
        let series = try await sut.run(characterIdentifier: 1009150)
        
        // Then
        XCTAssertNotNil(series)
        XCTAssertEqual(series.count, 3)
        let firstResult = try XCTUnwrap(series.first)
        XCTAssertEqual(firstResult.id, 543)
        XCTAssertEqual(firstResult.title, "Weapon X (2002 - 2004)")
        XCTAssertEqual(firstResult.description, nil)
        XCTAssertEqual(firstResult.thumbnail, "http://i.annihil.us/u/prod/marvel/i/mg/7/00/4bb66fe856148.jpg")
    }
    
    func testGetSeries_WhenResponseIsEmpty_ShouldReturnError() async throws {
        // Given
        mockCharactersRepository.receivedSeries = []
        
        // When
        var presentationError: PresentationError?
        do {
            let _ = try await sut.run(characterIdentifier: 1009150)
        } catch let error as PresentationError {
            presentationError = error
        }
        
        // Then
        XCTAssertNotNil(presentationError)
        XCTAssertEqual(presentationError, .emptyList())
    }
}
