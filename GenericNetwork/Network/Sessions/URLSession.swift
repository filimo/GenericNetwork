//
//  URLSession.swift
//  Traning_SUI2
//
//  Created by Viktor Kushnerov on 10/9/20.
//

import Foundation
import Combine

extension URLSession {
    func publisher<K, R>(
        for endpoint: Endpoint<K, R>,
        using requestData: K.RequestData,
        decoder: JSONDecoder = .init()
    ) -> AnyPublisher<R, Error>  where R: Codable {
        guard let request = endpoint.makeRequest(with: requestData) else {
            return Fail(
                error: InvalidEndpointError(endpoint: endpoint)
            ).eraseToAnyPublisher()
        }

        return dataTaskPublisher(for: request)
            .map(\.data)
            .decode(type: NetworkResponse<R>.self, decoder: decoder)
            .map(\.results)
            .eraseToAnyPublisher()
    }
}

extension URLSession {
    convenience init<T: MockURLResponder>(mockResponder: T.Type) {
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol<T>.self]
        self.init(configuration: config)
        URLProtocol.registerClass(MockURLProtocol<T>.self)
    }
}
