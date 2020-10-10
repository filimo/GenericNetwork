//
//  SearchResultsLoader.swift
//  Traning_SUI2
//
//  Created by Viktor Kushnerov on 10/9/20.
//

import Foundation
import Combine

struct SearchResultsLoader {
    var urlSession = URLSession.shared
    var userSession: UserSession

    func loadResults(
        matching query: String
    ) -> AnyPublisher<SearchResults, Error> {
        urlSession.publisher(
            for: .search(for: query),
            using: userSession.accessToken
        )
    }
}

