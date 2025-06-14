import Foundation

protocol GetSeriesUseCaseProtocol {
    func run(characterIdentifier: Int) async throws -> [SerieModel]
}

final class GetSeriesUseCase: GetSeriesUseCaseProtocol {
    private let charactersRepository: CharactersRepositoryProtocol
    
    init(charactersRepository: CharactersRepositoryProtocol = CharactersRepository.shared) {
        self.charactersRepository = charactersRepository
    }
    
    func run(characterIdentifier: Int) async throws -> [SerieModel] {
        try await charactersRepository.getSeries(characterIdentifier: characterIdentifier)
    }
}
