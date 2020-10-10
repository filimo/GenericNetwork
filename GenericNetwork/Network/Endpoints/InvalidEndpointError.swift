//
//  InvalidEndpointError.swift
//  Traning_SUI2
//
//  Created by Viktor Kushnerov on 10/10/20.
//

import Foundation

struct InvalidEndpointError<K, R>: Error where K: EndpointKind, R: Decodable {
    let endpoint: Endpoint<K, R>
}
