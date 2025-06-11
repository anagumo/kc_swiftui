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
}
