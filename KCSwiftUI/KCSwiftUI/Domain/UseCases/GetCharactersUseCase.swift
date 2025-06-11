import Foundation

protocol GetCharactersUseCaseProtocol {
    func run() async throws -> [Character]
}

final class GetCharactersUseCase: GetCharactersUseCaseProtocol {
    private let charactersRepository: CharactersRepositoryProtocol
    
    init(charactersRepository: CharactersRepositoryProtocol = CharactersRepository.shared) {
        self.charactersRepository = charactersRepository
    }
    
    func run() async throws -> [Character] {
        try await charactersRepository.getAll()
    }
}
