import XCTest
@testable import KCSwiftUI

final class CharactersRepositoryTests: XCTestCase {
    var sut: CharactersRepositoryProtocol?
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        let configuration = URLSessionConfiguration.default
        configuration.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession(configuration: configuration)
        let apiSession = APISession(urlSession: urlSession)
        sut = CharactersRepository(apiSession: apiSession)
    }
    
    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func testGetCharacters_ShouldSuccess() async throws {
        // Given
        MockURLProtocol.requestHandler = { request in
            let url = try XCTUnwrap(request.url)
            let httpURLResponse = try XCTUnwrap(MockURLProtocol.httpURLResponse(url: url, statusCode: 200))
            let fileURL = try XCTUnwrap(Bundle(for: APISessionTests.self).url(forResource: "Characters", withExtension: "json"))
            let data = try XCTUnwrap(Data(contentsOf: fileURL))
            return (httpURLResponse, data)
        }
        
        // When
        let characters = try await sut?.getAll()
        
        // Then
        XCTAssertNotNil(characters)
        XCTAssertEqual(characters?.count, 10)
        let firstResult = try XCTUnwrap(characters?.first)
        XCTAssertEqual(firstResult.name, "Agent Zero")
        XCTAssertEqual(firstResult.thumbnail, "http://i.annihil.us/u/prod/marvel/i/mg/f/60/4c0042121d790.jpg")
    }
    
    func testGetCharacters_ShouldReturnPresentationError() async throws {
        // Given
        MockURLProtocol.requestHandler = { request in
            let url = try XCTUnwrap(request.url)
            let httpURLResponse = try XCTUnwrap(MockURLProtocol.httpURLResponse(url: url, statusCode: 200))
            let fileURL = try XCTUnwrap(Bundle(for: APISessionTests.self).url(forResource: "EmptyResponse", withExtension: "json"))
            let data = try XCTUnwrap(Data(contentsOf: fileURL))
            return (httpURLResponse, data)
        }
        
        // When
        var presentationError: PresentationError?
        do {
            let _ = try await sut?.getAll()
        } catch let error as PresentationError? {
            presentationError = error
        }
        
        // Then
        XCTAssertNotNil(presentationError)
        let error = try XCTUnwrap(presentationError)
        XCTAssertEqual(error, .emptyList())
    }
    
    func testGetSeries_ShouldSuccess() async throws {
        // Given
        MockURLProtocol.requestHandler = { request in
            let url = try XCTUnwrap(request.url)
            let httpURLResponse = try XCTUnwrap(MockURLProtocol.httpURLResponse(url: url, statusCode: 200))
            let fileURL = try XCTUnwrap(Bundle(for: APISessionTests.self).url(forResource: "Series", withExtension: "json"))
            let data = try XCTUnwrap(Data(contentsOf: fileURL))
            return (httpURLResponse, data)
        }
        
        // When
        let series = try await sut?.getSeries(characterIdentifier: 1009150)
        
        // Then
        XCTAssertNotNil(series)
        XCTAssertEqual(series?.count, 10)
        let firstResult = try XCTUnwrap(series?.first)
        XCTAssertEqual(firstResult.title, "Life of Wolverine Infinity Comic (2022)")
        XCTAssertEqual(firstResult.thumbnail, "http://i.annihil.us/u/prod/marvel/i/mg/6/10/65132e8c1b4a7.jpg")
    }
    
    func testGetSeries_ShouldReturnPresentationError() async throws {
        // Given
        MockURLProtocol.requestHandler = { request in
            let url = try XCTUnwrap(request.url)
            let httpURLResponse = try XCTUnwrap(MockURLProtocol.httpURLResponse(url: url, statusCode: 200))
            let fileURL = try XCTUnwrap(Bundle(for: APISessionTests.self).url(forResource: "EmptyResponse", withExtension: "json"))
            let data = try XCTUnwrap(Data(contentsOf: fileURL))
            return (httpURLResponse, data)
        }
        
        // When
        var presentationError: PresentationError?
        do {
            let _ = try await sut?.getSeries(characterIdentifier: 1009150)
        } catch let error as PresentationError? {
            presentationError = error
        }
        
        // Then
        XCTAssertNotNil(presentationError)
        let error = try XCTUnwrap(presentationError)
        XCTAssertEqual(error, .emptyList())
    }
}
