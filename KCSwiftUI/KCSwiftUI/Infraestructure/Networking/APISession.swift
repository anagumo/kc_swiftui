import Foundation
import OSLog

protocol APISessionContract {
    func request<URLRequest: URLRequestComponents>(_ request: URLRequest) async throws -> URLRequest.Response
}

final class APISession: APISessionContract {
    static let shared = APISession()
    private let urlSession: URLSession
    
    init(urlSession: URLSession = .shared) {
        self.urlSession = urlSession
    }
    
    func request<URLRequest>(_ request: URLRequest) async throws -> URLRequest.Response where URLRequest : URLRequestComponents {
        let urlRequest = try URLRequestBuilder(urlRequestComponents: request).build()
        
        let (data, response) = try await urlSession.data(for: urlRequest)
        let statusCode = (response as? HTTPURLResponse)?.statusCode
        
        guard let statusCode else {
            Logger.log("Unexpected nil in status code", level: .error, layer: .infraestructure)
            throw APIError.server(url: request.path, statusCode: statusCode)
        }
        
        switch statusCode {
        case 200..<300:
            do {
                let response = try JSONDecoder().decode(URLRequest.Response.self, from: data)
                return response
            } catch {
                Logger.log("Failed to decoding from data: \(error)", level: .error, layer: .infraestructure)
                throw APIError.decoding(url: request.path)
            }
        default:
            Logger.log("Failed handle response with code: \(statusCode)", level: .error, layer: .infraestructure)
            throw APIError.server(url: request.path, statusCode: statusCode)
        }
    }
}

enum APIConstants {
    static let ts: String = "1749500471"
    static let publicKey: String = "02b356094265fecd8d598b831cbfa712"
    static let hash: String = "e551e2cf8ae7bf05da942cb180f3145b"
}
