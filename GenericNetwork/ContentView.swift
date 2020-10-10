//
//  ContentView.swift
//  GenericNetwork
//
//  Created by Viktor Kushnerov on 10/10/20.
//

import Combine
import SwiftUI

struct ContentView: View {
    @State var item: Item?
    static var publisher: AnyCancellable? = nil

    var body: some View {
        Text("Item title: \(item?.title ?? "")")
            .padding()
            .onAppear {
                let session = URLSession(mockResponder: Item.MockDataURLResponder.self)
                let accessToken = AccessToken(rawValue: "12345")

                publisher = session.publisher(for: .latestItem, using: accessToken)
                    .sink(receiveCompletion: { _ in }, receiveValue: update(item:))
            }
    }

    func update(item: Item) {
        print(item)
        self.item = item
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .onAppear {
                
            }
    }
}
