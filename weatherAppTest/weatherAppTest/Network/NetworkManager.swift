//
//  NetworkManager.swift
//  weatherAppTest
//
//  Created by Александр Воробей on 17.01.2022.
//

import Foundation

final class NetworkManager<T: Codable> {
    static func baseRequest(for url: URL, completion: @escaping (Result<T, NetworkError>) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            print(url)
            guard error == nil else {
                completion(.failure(.error(error: error!.localizedDescription)))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let json = try JSONDecoder().decode(T.self, from: data)
                completion(.success(json))
            } catch let error {
                completion(.failure(.decodingError(error: error.localizedDescription)))
            }
        }.resume()
    }
}

enum NetworkError: Error {
    case invalidResponse
    case invalidData
    case error(error: String)
    case decodingError(error: String)
}
