import Foundation

protocol GetCharactersUseCaseProtocol {
    func run() async throws -> [Character]
}

final class GetCharactersUseCase: GetCharactersUseCaseProtocol {
    private let charactersRepository: CharactersRepository
    
    init(charactersRepository: CharactersRepository) {
        self.charactersRepository = charactersRepository
    }
    
    func run() async throws -> [Character] {
        try await charactersRepository.getAll()
    }
}
