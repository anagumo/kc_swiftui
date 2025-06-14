import Foundation

protocol GetCharactersUseCaseProtocol {
    func run() async throws -> [CharcterModel]
}

final class GetCharactersUseCase: GetCharactersUseCaseProtocol {
    private let charactersRepository: CharactersRepositoryProtocol
    
    init(charactersRepository: CharactersRepositoryProtocol = CharactersRepository.shared) {
        self.charactersRepository = charactersRepository
    }
    
    func run() async throws -> [CharcterModel] {
        try await charactersRepository.getAll()
    }
}
