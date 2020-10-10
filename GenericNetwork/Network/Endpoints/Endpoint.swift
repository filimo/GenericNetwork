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
    func makeRequest(with data: Kind.RequestData,
                     host: URLHost = .default) -> URLRequest?
    {
        var components = URLComponents()
        components.scheme = "https"
        components.host = host.rawValue
        components.path = "/" + path
        components.queryItems = queryItems.isEmpty ? nil : queryItems

        guard let url = components.url else {
            return nil
        }

        var request = URLRequest(url: url)
        Kind.prepare(&request, with: data)
        return request
    }
}

