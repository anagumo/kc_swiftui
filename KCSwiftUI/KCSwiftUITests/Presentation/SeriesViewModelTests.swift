import XCTest
@testable import KCSwiftUI

final class SeriesViewModelTests: XCTestCase {
    var sut: SeriesViewModel!
    var mockGetSeriesUseCase: MockGetSeriesUseCase!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        mockGetSeriesUseCase = MockGetSeriesUseCase()
        sut = SeriesViewModel(
            characterIdentifier: 1009150,
            getSeriesUseCase: mockGetSeriesUseCase
        )
    }
    
    override func tearDownWithError() throws {
        sut = nil
        mockGetSeriesUseCase = nil
        try super.tearDownWithError()
    }
    
    func testLoadSeries_WhenStateIsLoaded() async throws {
        // Given
        mockGetSeriesUseCase.receivedSeries = DomainData.givenSerieList
        
        // When
        sut.load()
        try await Task.sleep(for: .seconds(0.1))
        
        // Then
        XCTAssertEqual(sut.serieViewState, .loaded)
        XCTAssert(!sut.series.isEmpty)
        let firstResult = try XCTUnwrap(sut.series.first)
        XCTAssertEqual(firstResult.title, "Weapon X (2002 - 2004)")
    }
    
    func testLoadEmptyView_WhenStateIsEmpty() async throws {
        // Given
        mockGetSeriesUseCase.receivedSeries = nil
        
        // When
        sut.load()
        try await Task.sleep(for: .seconds(0.1))
        
        // Then
        XCTAssertEqual(sut.serieViewState, .empty)
        XCTAssert(sut.series.isEmpty)
        XCTAssertNil(sut.series.first)
    }
}
