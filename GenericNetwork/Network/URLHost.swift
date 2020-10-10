//
//  URLHost.swift
//  GenericNetwork
//
//  Created by Viktor Kushnerov on 10/10/20.
//

import Foundation

struct URLHost: RawRepresentable {
    var rawValue: String
}

extension URLHost {
    static var staging: Self {
        URLHost(rawValue: "staging.api.myapp.com")
    }

    static var production: Self {
        URLHost(rawValue: "api.myapp.com")
    }

    static var `default`: Self {
        #if DEBUG
        return staging
        #else
        return production
        #endif
    }
}

