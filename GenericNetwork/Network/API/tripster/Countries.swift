//
//  Countries.swift
//  GenericNetwork
//
//  Created by Viktor Kushnerov on 10/10/20.
//

import Foundation

struct Country: Codable {
    let region: String
}

typealias Countries = [Country]
