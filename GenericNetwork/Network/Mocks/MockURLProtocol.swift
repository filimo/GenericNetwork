//
//  MockURLProtocol.swift
//  GenericNetwork
//
//  Created by Viktor Kushnerov on 10/10/20.
//

import Foundation

class MockURLProtocol<Responder: MockURLResponder>: URLProtocol {
    override class func canInit(with request: URLRequest) -> Bool {
        true
    }

    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        request
    }

    override func startLoading() {
        guard let client = client else { return }

        do {
            // Here we try to get data from our responder type, and
            // we then send that data, as well as a HTTP response,
            // to our client. If any of those operations fail,
            // we send an error instead:
            guard let url = request.url else {
                assertionFailure("URL failed")
                return
            }
            
            let data = try Responder.respond(to: request)
            guard let response = HTTPURLResponse(
                url: url,
                statusCode: 200,
                httpVersion: "HTTP/1.1",
                headerFields: nil
            ) else {
                assertionFailure("HTTPURLResponse failed")
                return
            }
            
            client.urlProtocol(self,
                didReceive: response,
                cacheStoragePolicy: .notAllowed
            )
            client.urlProtocol(self, didLoad: data)
        } catch {
            client.urlProtocol(self, didFailWithError: error)
        }

        client.urlProtocolDidFinishLoading(self)
    }

    override func stopLoading() {
        // Required method, implement as a no-op.
    }
}
