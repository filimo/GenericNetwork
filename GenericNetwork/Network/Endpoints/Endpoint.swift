//
//  Endpoint.swift
//  Traning_SUI2
//
//  Created by Viktor Kushnerov on 10/9/20.
//

import Foundation

struct Endpoint<Kind: EndpointKind, Response: Decodable> {
    var path: String
    var queryItems = [URLQueryItem]()
}

extension Endpoint {
    func makeRequest(with data: Kind.RequestData) -> URLRequest? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.myapp.com"
        components.path = "/" + path
        components.queryItems = queryItems.isEmpty ? nil : queryItems

        // If either the path or the query items passed contained
        // invalid characters, we'll get a nil URL back:
        guard let url = components.url else {
            return nil
        }

        var request = URLRequest(url: url)
        Kind.prepare(&request, with: data)
        return request
    }
}

extension Endpoint where Kind == EndpointKinds.Public, Response == [Item] {
    static var featuredItems: Self {
        Endpoint(path: "featured")
    }
}

extension Endpoint where Kind == EndpointKinds.Private,
                         Response == SearchResults {
    static func search(for query: String) -> Self {
        Endpoint(path: "search", queryItems: [
            URLQueryItem(name: "q", value: query)
        ])
    }
}
