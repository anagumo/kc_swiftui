import XCTest
@testable import KCSwiftUI

final class MockGetSeriesUseCase: GetSeriesUseCaseProtocol {
    var receivedSeries: [SerieModel]?
    
    func run(characterIdentifier: Int) async throws -> [KCSwiftUI.SerieModel] {
        guard let receivedSeries else {
            throw PresentationError.emptyList()
        }

        return receivedSeries
    }
}
