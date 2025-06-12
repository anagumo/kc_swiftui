import Foundation

protocol GetSeriesUseCaseProtocol {
    func run(characterIdentifier: Int) async throws -> [KCSerie]
}

final class GetSeriesUseCase: GetSeriesUseCaseProtocol {
    private let charactersRepository: CharactersRepositoryProtocol
    
    init(charactersRepository: CharactersRepositoryProtocol = CharactersRepository.shared) {
        self.charactersRepository = charactersRepository
    }
    
    func run(characterIdentifier: Int) async throws -> [KCSerie] {
        try await charactersRepository.getSeries(characterIdentifier: characterIdentifier)
    }
}
