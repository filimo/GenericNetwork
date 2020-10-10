//
//  ContentView2.swift
//  GenericNetwork
//
//  Created by Viktor Kushnerov on 10/10/20.
//

import SwiftUI

struct ContentView2: View {
    @ObservedObject var store = Store.shared
    
    var body: some View {
        Text("Title: \(store.item?.title ?? "")")
            .navigationTitle("Mock via Store")
    }
}

struct ContentView2_Previews: PreviewProvider {
    static var previews: some View {
        ContentView2()
    }
}
