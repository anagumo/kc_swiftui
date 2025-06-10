import Foundation

struct GetSeriesURLRequest: URLRequestComponents {
    typealias Response = MarvelResponse<SerieDTO>
    var path: String = "/v1/public/series"
    var httpMethod: HTTPMethod = .GET
    var queryParameters: [String : String]?
    
    init(characterIdentifier: String) {
        queryParameters = [
            "ts": APIConstants.ts,
            "apikey": APIConstants.publicKey,
            "hash": APIConstants.hash,
            "characters": characterIdentifier
        ]
    }
}
