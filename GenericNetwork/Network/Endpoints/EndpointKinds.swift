//
//  EndpointKinds.swift
//  Traning_SUI2
//
//  Created by Viktor Kushnerov on 10/9/20.
//

import Foundation

protocol EndpointKind {
    associatedtype RequestData

    static func prepare(_ request: inout URLRequest,
                        with data: RequestData)
}

enum EndpointKinds {
    enum Public: EndpointKind {
        static func prepare(_ request: inout URLRequest,
                            with _: Void) {
            // Here we can do things like assign a custom cache
            // policy for loading our publicly available data.
            // In this example we're telling URLSession not to
            // use any locally cached data for these requests:
            request.cachePolicy = .reloadIgnoringLocalCacheData
        }
    }

    enum Private: EndpointKind {
        static func prepare(_ request: inout URLRequest,
                            with token: AccessToken) {
            // For our private endpoints, we'll require an
            // access token to be passed, which we then use to
            // assign an Authorization header to each request:
            request.addValue("Bearer \(token.rawValue)",
                forHTTPHeaderField: "Authorization"
            )
        }
    }
}

extension EndpointKinds {
    enum Stub: EndpointKind {
        static func prepare(_ request: inout URLRequest,
                            with data: Void) {
            // No-op
        }
    }
}
