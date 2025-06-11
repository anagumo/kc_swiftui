import Foundation

protocol CharactersRepositoryProtocol {
    func get() async throws -> [Character]
    func getSeries(characterIdentifier: Int) async throws -> [Serie]
}

final class CharactersRepository: CharactersRepositoryProtocol {
    private let apiSession: APISession
    
    init(apiSession: APISession) {
        self.apiSession = apiSession
    }
    
    func get() async throws -> [Character] {
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
    
    func getSeries(characterIdentifier: Int) async throws -> [Serie] {
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
