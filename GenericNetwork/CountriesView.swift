//
//  CountriesView.swift
//  GenericNetwork
//
//  Created by Viktor Kushnerov on 10/10/20.
//
import Combine
import SwiftUI

struct CountriesView: View {
    @State var countries: Countries?
    static private var publisher: AnyCancellable? = nil
    
    var body: some View {
        Text("\(countries?.first?.region ?? "")")
            .onAppear {
                Self.publisher = CountriesResultsLoader()
                    .loadResults()
                    .sink { result in
                        print(result)
                    } receiveValue: { countries in
                        self.countries = countries
                    }

            }
    }
}

struct CountriesView_Previews: PreviewProvider {
    static var previews: some View {
        CountriesView()
    }
}
