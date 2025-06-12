import Foundation

protocol GetCharactersUseCaseProtocol {
    func run() async throws -> [KCCharacter]
}

final class GetCharactersUseCase: GetCharactersUseCaseProtocol {
    private let charactersRepository: CharactersRepositoryProtocol
    
    init(charactersRepository: CharactersRepositoryProtocol = CharactersRepository.shared) {
        self.charactersRepository = charactersRepository
    }
    
    func run() async throws -> [KCCharacter] {
        try await charactersRepository.getAll()
    }
}
