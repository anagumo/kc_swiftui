import Foundation

struct APIError: Error, Equatable {
    let url: String
    let reason: String
    let statusCode: Int?
    
    init(url: String, reason: String, statusCode: Int? = nil) {
        self.url = url
        self.reason = reason
        self.statusCode = statusCode
    }
}

extension APIError {
    
    static func malformedURL(url: String) -> Self {
        APIError(
            url: url,
            reason: "Malformed URL"
        )
    }
    
    static func badRequest(url: String) -> Self {
        APIError(
            url: url,
            reason: "Bad request"
        )
    }
    
    static func server(url: String, statusCode: Int?) -> Self {
        APIError(
            url: url,
            reason: "There was a server error",
            statusCode: statusCode
        )
    }
    
    static func noData(url: String, statusCode: Int?) -> Self {
        APIError(
            url: url,
            reason: "No data provided",
            statusCode: statusCode
        )
    }
    
    static func decoding(url: String) -> Self {
        APIError(url: url, reason: "Cannot decode data from URL")
    }
    
    static func unknown(url: String) -> Self {
        APIError(
            url: url,
            reason: "Unknown server error"
        )
    }
}
