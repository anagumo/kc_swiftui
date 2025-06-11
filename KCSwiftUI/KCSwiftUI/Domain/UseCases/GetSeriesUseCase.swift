import Foundation

protocol GetSeriesUseCaseProtocol {
    func run(characterIdentifier: Int) async throws -> [Serie]
}

final class GetSeriesUseCase: GetSeriesUseCaseProtocol {
    private let charactersRepository: CharactersRepository
    
    init(charactersRepository: CharactersRepository) {
        self.charactersRepository = charactersRepository
    }
    
    func run(characterIdentifier: Int) async throws -> [Serie] {
        try await charactersRepository.getSeries(characterIdentifier: characterIdentifier)
    }
}
