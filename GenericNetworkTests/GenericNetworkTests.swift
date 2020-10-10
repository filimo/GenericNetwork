//
//  GenericNetworkTests.swift
//  GenericNetworkTests
//
//  Created by Viktor Kushnerov on 10/10/20.
//

@testable import GenericNetwork
import XCTest

class GenericNetworkTests: XCTestCase {
    typealias StubbedEndpoint = Endpoint<EndpointKinds.Stub, String>
    let host = URLHost(rawValue: "test")

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

    func testBasicRequestGeneration() throws {
        let endpoint = StubbedEndpoint(path: "path")
        let request = endpoint.makeRequest(with: (), host: host)

        try XCTAssertEqual(
            request?.url,
            host.expectedURL(withPath: "path")
        )
    }

    func testGeneratingRequestWithQueryItems() throws {
        let endpoint = StubbedEndpoint(path: "path", queryItems: [
            URLQueryItem(name: "a", value: "1"),
            URLQueryItem(name: "b", value: "2")
        ])

        let request = endpoint.makeRequest(with: (), host: host)

        try XCTAssertEqual(
            request?.url,
            host.expectedURL(withPath: "path?a=1&b=2")
        )
    }

    func testAddingAccessTokenToPrivateEndpoint() throws {
        let endpoint = Endpoint.search(for: "query")
        let token = AccessToken(rawValue: "12345")
        let request = endpoint.makeRequest(with: token, host: host)

        try XCTAssertEqual(
            request?.url,
            host.expectedURL(withPath: "search?q=query")
        )

        XCTAssertEqual(request?.allHTTPHeaderFields, [
            "Authorization": "Bearer 12345"
        ])
    }

    func testSuccessfullyPerformingRequest() throws {
        let session = URLSession(mockResponder: Item.MockDataURLResponder.self)
        let accessToken = AccessToken(rawValue: "12345")

        let publisher = session.publisher(for: .latestItem, using: accessToken)
        let result = try awaitCompletion(of: publisher)

        XCTAssertEqual(result, [Item.MockDataURLResponder.item])
    }

    func testFailingWhenEncounteringError() throws {
        let session = URLSession(mockResponder: MockErrorURLResponder.self)
        let accessToken = AccessToken(rawValue: "12345")

        let publisher = session.publisher(for: .latestItem, using: accessToken)
        XCTAssertThrowsError(try awaitCompletion(of: publisher))
    }
}

extension URLHost {
    func expectedURL(withPath path: String) throws -> URL {
        let url = URL(string: "https://" + rawValue + "/" + path)
        return try XCTUnwrap(url)
    }
}

