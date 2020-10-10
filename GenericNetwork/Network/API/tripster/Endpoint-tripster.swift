//
//  PublicEndpoint.swift
//  GenericNetwork
//
//  Created by Viktor Kushnerov on 10/10/20.
//

import Foundation

extension Endpoint where
    Kind == EndpointKinds.Public,
    Response == Countries
{
    static var countries: Self {
        Endpoint(path: "api/countries/")
    }
}


