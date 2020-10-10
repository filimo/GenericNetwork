//
//  GenericNetworkApp.swift
//  GenericNetwork
//
//  Created by Viktor Kushnerov on 10/10/20.
//

import SwiftUI

#if targetEnvironment(simulator) && DEBUG
import Bagel
#endif

@main
struct GenericNetworkApp: App {
    init() {
        #if targetEnvironment(simulator) && DEBUG
        Bagel.start()
        #endif
    }

    var body: some Scene {
        WindowGroup {
            CountriesView()
        }
        
    }
}
