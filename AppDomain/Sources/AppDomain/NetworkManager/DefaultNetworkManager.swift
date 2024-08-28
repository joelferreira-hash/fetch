//
//  File.swift
//
//
//  Created by Joel Ferriera on 8/21/24.
//

import Foundation

public class DefaultNetworkManager: NetworkManager {
    private let decoder: JSONDecoder
    private let session: URLSession

    public init(
        decoder: JSONDecoder = JSONDecoder(),
        session: URLSession = URLSession.shared
    ) {
        self.decoder = decoder
        self.session = session
    }

    public func request<Element: Codable>(
        _ request: RequestProtocol
    ) async throws -> Element {
        let urlRequest = try request.urlRequest()
        let (data, response) = try await session.data(for: urlRequest)
        try verifyResponse(response)
        return try decoder.decode(Element.self, from: data)
    }
    
    private func verifyResponse(_ response: URLResponse) throws {
        guard let response = response as? HTTPURLResponse else { throw FetchError.unkownError }
        guard response.statusCode == 200 else { throw FetchError.invalidResponse }
    }
}
