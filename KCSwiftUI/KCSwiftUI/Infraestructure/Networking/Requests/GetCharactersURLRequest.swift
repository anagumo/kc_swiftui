import Foundation

struct GetCharactersURLRequest: URLRequestComponents {
    typealias Response = MarvelResponse<CharacterDTO>
    var path: String = "/v1/public/characters"
    var queryParameters: [String : String]?
    var httpMethod: HTTPMethod = .GET
    
    init() {
        queryParameters = [
            "ts": APIConstants.ts,
            "apikey": APIConstants.publicKey,
            "hash": APIConstants.hash
        ]
    }
}
