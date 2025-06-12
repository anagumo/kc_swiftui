import Foundation
import Combine

enum SerieViewState {
    case none, loading, loaded, empty
}

@Observable final class SeriesViewModel {
    private let getSeriesUseCase: GetSeriesUseCaseProtocol
    var characterIdentifier: Int
    var serieViewState: SerieViewState
    var series: [KCSerie]
    
    init(characterIdentifier: Int,
         getSeriesUseCase: GetSeriesUseCaseProtocol) {
        self.characterIdentifier = characterIdentifier
        serieViewState = .none
        series = []
        self.getSeriesUseCase = getSeriesUseCase
    }
    
    func load() {
        serieViewState = .loading
        
        Task {
            do {
                let series = try await getSeriesUseCase.run(characterIdentifier: characterIdentifier)
                self.series = series
                serieViewState = .loaded
            } catch _ as PresentationError {
                serieViewState = .empty
            }
        }
    }
}
