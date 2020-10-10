//
//  NetworkResponse.swift
//  Traning_SUI2
//
//  Created by Viktor Kushnerov on 10/9/20.
//

import Foundation

struct NetworkResponse<Wrapped: Decodable>: Decodable {
    var result: Wrapped
}
