//
import Combine
//  Store.swift
//  GenericNetwork
//
//  Created by Viktor Kushnerov on 10/10/20.
//
import Foundation

class Store: ObservableObject {
    static let shared = Store()

    @Published var item: Item? = nil

    var publisher: AnyCancellable? = nil

    private init() {
        let session = URLSession(mockResponder: Item.MockDataURLResponder.self)
        let accessToken = AccessToken(rawValue: "12345")

        publisher = session.publisher(for: .latestItem, using: accessToken)
            .sink(
                receiveCompletion: { _ in },
                receiveValue: update(item:)
            )
    }

    private func update(item: Item) {
        print(item)
        self.item = item
    }
}
