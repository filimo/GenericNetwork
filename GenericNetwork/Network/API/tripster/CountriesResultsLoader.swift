//
//  CountriesResultsLoader.swift
//  GenericNetwork
//
//  Created by Viktor Kushnerov on 10/10/20.
//

import Combine
import Foundation

struct CountriesResultsLoader {
    private let urlSession = URLSession.shared

    func loadResults() -> AnyPublisher<Countries, Error> {
        urlSession.publisher(
            for: .countries,
            using: ()
        )
    }
}
