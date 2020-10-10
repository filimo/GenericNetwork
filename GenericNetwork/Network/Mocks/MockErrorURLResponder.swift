//
//  MockErrorURLResponder.swift
//  GenericNetworkTests
//
//  Created by Viktor Kushnerov on 10/10/20.
//

import Foundation

enum MockErrorURLResponder: MockURLResponder {
    static func respond(to request: URLRequest) throws -> Data {
        throw URLError(.badServerResponse)
    }
}
