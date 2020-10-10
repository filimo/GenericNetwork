//
//  Item.swift
//  Traning_SUI2
//
//  Created by Viktor Kushnerov on 10/10/20.
//

import Foundation

struct Item: Codable, Equatable {
    let id: UUID
    var title: String
    let description: String
}

extension Item {
    enum MockDataURLResponder: MockURLResponder {
        static let item = Item(id: UUID(), title: "title value", description: "Description")

        static func respond(to request: URLRequest) throws -> Data {
            let response = NetworkResponse(results: item)
            return try JSONEncoder().encode(response)
        }
    }
}
