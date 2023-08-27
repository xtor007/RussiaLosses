//
//  NetworkService.swift
//  RussiaLosses
//
//  Created by Anatoliy Khramchenko on 24.08.2023.
//

import Foundation

class NetworkService {

    let request: URLRequest

    init(request: URLRequest) {
        self.request = request
    }

    func makeRequest<GetType: Decodable>() async throws -> GetType {
        return try await withCheckedThrowingContinuation({ continuation in
            makeRequest { result in
                continuation.resume(with: result)
            }
        })
    }

    private func makeRequest<GetType: Decodable>(callback: @escaping (Result<GetType, Error>) -> Void) {
        URLSession.shared.dataTask(with: request) { data, res, error in
            guard error == nil, let res = res as? HTTPURLResponse, let data else {
                callback(.failure(error!))
                return
            }
            do {
                if 200...299 ~= res.statusCode {
                    let result = try JSONDecoder().decode(GetType.self, from: data)
                    callback(.success(result))
                } else {
                    callback(.failure(NetworkError.responseStatusError))
                }
            } catch {
                callback(.failure(error))
            }
        }
        .resume()
    }

}
