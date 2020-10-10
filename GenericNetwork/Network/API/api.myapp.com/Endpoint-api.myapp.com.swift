//
//  Endpoint.swift
//  GenericNetwork
//
//  Created by Viktor Kushnerov on 10/10/20.
//

import Foundation

extension Endpoint where
    Kind == EndpointKinds.Public,
    Response == [Item]
{
    static var featuredItems: Self {
        Endpoint(path: "featured")
    }
}

extension Endpoint where
    Kind == EndpointKinds.Private,
    Response == SearchResults
{
    static func search(for query: String) -> Self {
        Endpoint(path: "search", queryItems: [
            URLQueryItem(name: "q", value: query)
        ])
    }
}

extension Endpoint where
    Kind == EndpointKinds.Private,
    Response == Item
{
    static var latestItem: Self {
        Endpoint(path: "latestItem")
    }
}
