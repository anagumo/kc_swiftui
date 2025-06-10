import Foundation
import OSLog

final class URLRequestBuilder {
    private let URLRequestComponents: any URLRequestComponents
    
    init(urlRequestComponents: any URLRequestComponents) {
        self.URLRequestComponents = urlRequestComponents
    }
    
    private func url() throws -> URL {
        var urlComponents: URLComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = URLRequestComponents.host
        urlComponents.path = URLRequestComponents.path
        
        if let queryParameters = URLRequestComponents.queryParameters, !queryParameters.isEmpty {
            Logger.log("The URL has query params: \(queryParameters)", level: .debug, layer: .infraestructure)
            urlComponents.queryItems = queryParameters.map {
                URLQueryItem(name: $0.key, value: $0.value)
            }
        }
        
        guard let url = urlComponents.url else {
            Logger.log("Failed to create an URL", level: .error, layer: .infraestructure)
            throw APIError.malformedURL(url: URLRequestComponents.path)
        }
        
        return url
    }
    
    func build() throws -> URLRequest {
        do {
            var urlRequest = try URLRequest(url: url())
            urlRequest.httpMethod = URLRequestComponents.httpMethod.rawValue
            urlRequest.allHTTPHeaderFields = [
                "Content-Type": "application/json; charset=utf-8",
                "Accept": "application/json"
            ].merging(URLRequestComponents.headers) { $1 }
            
            if let body = URLRequestComponents.body {
                Logger.log("The URL request has body: \(body)", level: .debug, layer: .infraestructure)
                urlRequest.httpBody = try JSONEncoder().encode(body)
            }
            
            return urlRequest
        } catch {
            Logger.log("Failed to create an URL request", level: .error, layer: .infraestructure)
            throw APIError.badRequest(url: URLRequestComponents.path)
        }
    }
}
