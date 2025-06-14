import Foundation

protocol CharactersRepositoryProtocol {
    func getAll() async throws -> [CharcterModel]
    func getSeries(characterIdentifier: Int) async throws -> [SerieModel]
}

final class CharactersRepository: CharactersRepositoryProtocol {
    static let shared = CharactersRepository()
    private let apiSession: APISessionContract
    
    init(apiSession: APISessionContract = APISession.shared) {
        self.apiSession = apiSession
    }
    
    func getAll() async throws -> [CharcterModel] {
        let characters = try await apiSession.request(
            GetCharactersURLRequest()
        ).data.results
        
        if characters.isEmpty {
            throw PresentationError.emptyList()
        } else {
            return characters.map {
                CharacterDTOtoDomainMapper().map($0)
            }
        }
    }
    
    func getSeries(characterIdentifier: Int) async throws -> [SerieModel] {
        let series = try await apiSession.request(
            GetSeriesURLRequest(characterIdentifier: characterIdentifier)
        ).data.results
        
        if series.isEmpty {
            throw PresentationError.emptyList()
        } else {
            return series.map {
                SerieDTOToDomainMapper().map($0)
            }
        }
    }
}
