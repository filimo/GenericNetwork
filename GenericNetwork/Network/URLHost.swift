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
        URLHost(rawValue: "experience.tripster.ru")
    }

    static var production: Self {
        URLHost(rawValue: "experience.tripster.ru")
    }

    static var `default`: Self {
        #if DEBUG
        return staging
        #else
        return production
        #endif
    }
}

