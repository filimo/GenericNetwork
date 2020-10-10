//
//  MockURLResponder.swift
//  GenericNetworkTests
//
//  Created by Viktor Kushnerov on 10/10/20.
//

import Foundation

protocol MockURLResponder {
    static func respond(to request: URLRequest) throws -> Data
}


