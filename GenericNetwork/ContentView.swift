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
        NavigationView {
            VStack {
                NavigationLink("Mock via Store", destination: ContentView2())

                Text("Item title: \(item?.title ?? "")")
                    .padding()
                    .onAppear {
                        let session = URLSession(mockResponder: Item.MockDataURLResponder.self)
                        let accessToken = AccessToken(rawValue: "12345")

                        Self.publisher = session.publisher(for: .latestItem, using: accessToken)
                            .sink(receiveCompletion: { _ in }, receiveValue: update(item:))
                    }
                    .navigationTitle("Mock via View.onAppear")
            }
        }
    }

    func update(item: Item) {
        self.item = item
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .onAppear {}
    }
}
