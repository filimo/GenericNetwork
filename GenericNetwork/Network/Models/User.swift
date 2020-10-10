//
//  User.swift
//  Traning_SUI2
//
//  Created by Viktor Kushnerov on 10/9/20.
//

import Foundation

struct User: Identifiable, Codable {
    let id: UUID
    var name: String
    var twitterHandle: String
    var gitHubUsername: String
}


