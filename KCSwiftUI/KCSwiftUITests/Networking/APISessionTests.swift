import XCTest
@testable import KCSwiftUI

final class APISessionTests: XCTestCase {
    var sut: APISessionContract?
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        let config = URLSessionConfiguration.default
        config.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession(configuration: config)
        sut = APISession(urlSession: urlSession)
    }
    
    override func tearDownWithError() throws {
        MockURLProtocol.requestHandler = nil
        MockURLProtocol.error = nil
        sut = nil
        try super.tearDownWithError()
    }
    
    func testGetCharactersURLRequest() async throws {
        // Given
        var receivedRequest: URLRequest?
        MockURLProtocol.requestHandler = { request in
            receivedRequest = request
            let url = try XCTUnwrap(request.url)
            let httpURLResponse = try XCTUnwrap(MockURLProtocol.httpURLResponse(url: url, statusCode: 200))
            let fileURL = try XCTUnwrap(Bundle(for: APISessionTests.self).url(forResource: "Characters", withExtension: "json"))
            let data = try XCTUnwrap(Data(contentsOf: fileURL))
            return (httpURLResponse, data)
        }
        
        // When
        let characters = try await sut?.request(GetCharactersURLRequest())
        
        // Then
        XCTAssertEqual(receivedRequest?.url?.path(), "/v1/public/characters")
        XCTAssertEqual(receivedRequest?.httpMethod, "GET")
        XCTAssertNotNil(characters)
        XCTAssertEqual(characters?.data.results.count, 10)
        let firstResult = try XCTUnwrap(characters?.data.results.first)
        XCTAssertEqual(firstResult.id, 1009150)
        XCTAssertEqual(firstResult.name, "Agent Zero")
        XCTAssertEqual(firstResult.thumbnail?.path, "http://i.annihil.us/u/prod/marvel/i/mg/f/60/4c0042121d790")
        XCTAssertEqual(firstResult.thumbnail?.pathExtension, "jpg")
        XCTAssertEqual(firstResult.thumbnail?.getPhoto(), "http://i.annihil.us/u/prod/marvel/i/mg/f/60/4c0042121d790.jpg")
    }
    
    func testGetSeriesURLRequest() async throws {
        // Given
        var receivedRequest: URLRequest?
        MockURLProtocol.requestHandler = { request in
            receivedRequest = request
            let url = try XCTUnwrap(request.url)
            let httpURLResponse = try XCTUnwrap(MockURLProtocol.httpURLResponse(url: url, statusCode: 200))
            let fileURL = try XCTUnwrap(Bundle(for: APISessionTests.self).url(forResource: "Series", withExtension: "json"))
            let data = try XCTUnwrap(Data(contentsOf: fileURL))
            return (httpURLResponse, data)
        }
        
        // When
        let series = try await sut?.request(
            GetSeriesURLRequest(characterIdentifier: 1009150)
        )
        
        // Then
        XCTAssertEqual(receivedRequest?.url?.path(), "/v1/public/series")
        XCTAssertEqual(receivedRequest?.httpMethod, "GET")
        XCTAssertNotNil(series)
        XCTAssertEqual(series?.data.results.count, 10)
        let firstResult = try XCTUnwrap(series?.data.results.first)
        XCTAssertEqual(firstResult.id, 34445)
        XCTAssertEqual(firstResult.title, "Life of Wolverine Infinity Comic (2022)")
        XCTAssertEqual(firstResult.thumbnail?.path, "http://i.annihil.us/u/prod/marvel/i/mg/6/10/65132e8c1b4a7")
        XCTAssertEqual(firstResult.thumbnail?.pathExtension, "jpg")
        XCTAssertEqual(firstResult.thumbnail?.getPhoto(), "http://i.annihil.us/u/prod/marvel/i/mg/6/10/65132e8c1b4a7.jpg")
    }
}
